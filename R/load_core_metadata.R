#' Gets common EML metadata elements and puts them in a dataframe
#' #' `r lifecycle::badge('experimental')`
#' 
#' #' @description `load_core_metadata()` gets commonly used EML metadata items from a previously downloaded data package, extracts them, and returns them as single data frame. This is particularly useful when importing data packages into Power BI as Power BI will only import items in data frames. 
#' 
#' #' @details The returned dataframe has three columns, EML_element, EML_data and EML_data2. EML_element describes the EML element that was extracted. EML_data and EML_data2 contain the data from that element. In the case of EML_elements with only one piece of data (e.g. the data package title), the data is repeated in the EML_data and EML_data2 columns.  In cases where the element contains two related pieces of data (e.g. author), those items are held in EML_data (e.g. the author's name) and EML_data2 (e.g. the author's email address). 
#' 
#' Currently this function is under development and may have issues if an author is an organization. If you have a data package with these issues, please contact [robert_baker@nps.gov](mailto:robert_baker@nps.gov).
#' 
#' The fields that should be returned in the dataframe include: title, publication date, authors (and emails), contacts (and emails), publisher, DOI, publisher city, publisher state, content begin date, content end date, the abstract, notes, "for or by NPS", the license name (e.g. "Public Domain", "CC0"), and a list of each data file in the data package by name.
#'
#' @param ds_ref Integer. The DataStore reference number of a previously downloaded data package (if downloaded using `get_data_packages()`).
#' @param path String. The location of the data package. If you used the default settings for where data packages are downloaded by `get_data_packages()`, directory can also be left as the default.
#'
#' @return dataframe
#' @export
#'
#' @examples
#' \dontrun{
#' df <- load_core_metadata(1234567)
#' }
#' 
load_core_metadata <- function(ds_ref, path = here::here("data")){
  #construct path to downloaded data package:
  #capture current/original working directory:
  
  #origin_wd <- getwd()
  #set directory back to original working directory on exit.
  #on.exit(setwd(origin_wd), add=TRUE)
  
  #setwd(path)
  #directory <- paste0(path, "/", ds_ref)
  
  #load metadata
  #metadata <- DPchecker::load_metadata(directory = directory)
  metadata <- DPchecker::load_metadata(directory = here::here(path, ds_ref))
  
  title <- EMLeditor::get_title(metadata)
  pub_date <- metadata$dataset$pubDate
  
  authors <- .get_authors(metadata) #returns dataframe [x,3]
  authors$eml_element = "author"
  authors <- authors[,c(3,1,2)]
  
  contacts <- .get_contacts(metadata) # returns dataframe [x,3]
  contacts$eml_element = "contact"
  contacts <- contacts[,c(3,1,2)]
  
  publisher <- metadata$dataset$publisher$organizationName
  doi <- EMLeditor::get_doi(metadata)
  
  #get publication location (city, state)
  pub_city <- metadata$dataset$publisher$address$city
  pub_state <- metadata$dataset$publisher$address$administrativeArea
  pub_location <- paste0(pub_city, ", ", pub_state)
  
  content_begin <- EMLeditor::get_begin_date(metadata)
  content_end <- EMLeditor::get_end_date(metadata)
  abstract <- paste(unlist((metadata[["dataset"]][["abstract"]])),
                    collapse = " ")
  notes <- paste(unlist((metadata$dataset$additionalInfo)), collapse = " ")
  
  #get by or for NPS
  nps <- unlist(metadata$additionalMetadata, recursive = FALSE)
  nps2 <- unlist(nps, recursive = FALSE)
  agency <- nps2$metadata.agencyOriginated$agency
  by_for <-nps2$metadata.agencyOriginated$byOrForNPS
  if(agency == "NPS" & by_for == TRUE){
    origination <- "The information resource described by this reference was created by or for the NPS"
  } else {
    origination <- "The information resource described by this reference was not created by or for the NPS"
  }
  
  license_name <- metadata$dataset$licensed$licenseName
  
  #get files lists:
  #files <- list.files(path=directory, pattern = "*\\.csv", ignore.case = TRUE)
  files <- list.files(path=here::here(path, ds_ref),
                      pattern = "*\\.csv", ignore.case = TRUE)
  file_names <- data.frame(files, files)
  file_names$eml_element <- "data_file"
  file_names <- file_names[,c(3,1,2)]
  
  #build dataframe for return object:
  EML_metadata <- data.frame(EML_element = as.character(),
                             EML_data = as.character(),
                             EML_data2 = as.character())
  
  EML_metadata[nrow(EML_metadata) + 1,] <- list("Title", title, title)
  EML_metadata[nrow(EML_metadata) + 1,] <- list("Published_date",
                                                pub_date,
                                                pub_date)
  EML_metadata <- data.frame(mapply(c, EML_metadata, authors, SIMPLIFY=FALSE))
  EML_metadata <- data.frame(mapply(c, EML_metadata, contacts, SIMPLIFY=FALSE))
  EML_metadata[nrow(EML_metadata) + 1,] <- list("publisher",
                                                publisher,
                                                publisher)
  EML_metadata[nrow(EML_metadata) + 1,] <- list("doi", doi, doi)
  EML_metadata[nrow(EML_metadata) + 1,] <- list("pub_city", pub_city, pub_city)
  EML_metadata[nrow(EML_metadata) + 1,] <- list("pub_state",
                                                pub_state,
                                                pub_state)
  EML_metadata[nrow(EML_metadata) + 1,] <- list("content_begin",
                                                content_begin,
                                                content_begin)
  EML_metadata[nrow(EML_metadata) + 1,] <- list("content_end",
                                                content_end,
                                                content_end)
  EML_metadata[nrow(EML_metadata) + 1,] <- list("abstract", abstract, abstract)
  EML_metadata[nrow(EML_metadata) + 1,] <- list("notes", notes, notes)
  EML_metadata[nrow(EML_metadata) + 1,] <- list("origination",
                                                origination,
                                                origination)
  EML_metadata[nrow(EML_metadata) + 1,] <- list("license_name",
                                                license_name,
                                                license_name)
  #not sure why the mapply didn't work here but for some reason it caused the 
  #dataframe to have 57 columns (but the right number of rows). Could have
  #spent a while longer trouble shooting, but I went for simple if inelegant
  #and just renamed the columns and used rbind.
  colnames(file_names) <- colnames(EML_metadata)
  EML_metadata <- rbind(EML_metadata, file_names)
  
  return(EML_metadata)
}

#' Extracts authors and contact email addresses from EML metadata
#' 
#' `r lifecycle::badge('experimental')`
#'   
#' @description `.get_authors()` extracts the "creators" element from EML metadata and returns it as a dataframe with three columsn, first a column indicating that each row is an author. Second, and column with the author's name (first last). Third, the author's email address.
#' 
#' @details There are some known issues with this function; unfortunately at this time we do not have example data packages to test them. These include: authors without a givenName and organizations as authors where there is no individualName.
#'
#' @param metadata an EML formatted R object
#'
#' @return dataframe
#' @keywords private
#' @noRd
#'
#' @examples
#' \dontrun{
#' authors <- get_authors(metadata)
#' }
.get_authors <- function(metadata){
  #get authors
  creators <- metadata$dataset$creator
  #set up empty dataframe to hold creator info:
  individual <- data.frame(author = as.character(),
                           contact = as.character())
  
  #if single creator, nest it so that it behaves the same as when there are
  #multiple creators:
  if ("organizationName" %in% names(creators) |
      "individualName" %in% names(creators)) {
    creators <- list(creators)
  }
  
  for (i in 1:length(seq_along(creators))) {
    creator <- unlist(creators[[i]], recursive = FALSE)
    #if there is an individual name:
    if (!is.null(creator$
                 individualName.surName)) {
      #if there is a given name:
      if (!is.null(creator$individualName.givenName)) {
        given <- NULL
        for (i in 1:length(seq_along(creator$individualName.givenName))) {
          if (nchar(creator$individualName.givenName[[i]]) == 1) {
            given <- paste0(given,
                            paste0(creator$individualName.givenName[[i]],
                            ". "))
          } else {
              given <- paste0(given,
                              paste0(creator$individualName.given[[i]],
                                     " "))
          }
        }
      } else {
        #if there is no given name:
        given <- NA
      }
      #get rid of extra whitespaces and trailing whitespaces:
      given <- stringr::str_squish(given)
      
      #get last name
      sur <- creator$individualName.surName
      #generate full name as first (first) last
      full_name <- paste(given, sur, sep = " ")
      if(!is.null(creator$electronicMailAddress)){
        mail <- creator$electronicMailAddress
      } else {
        mail <- NA
      }
      #turn name & contact into a dataframe
      author <- data.frame(full_name, mail)
      #append to the pre-existing dataframe
      individual <- rbind(individual, author)
    } else {
      #if there are not individual names (just organization)
      author <- data.frame(creator$organizationName, NA)
      individual <- rbind(individual, author)
    }
  }
  colnames(individual)<-c("author", "email")
  return(individual)
}

#' Extracts contacts and email addresses from EML metadata
#' 
#' `r lifecycle::badge('experimental')`
#' 
#' @description `.get_contacts()` extracts the "contacts" element from EML metadata and returns it as a dataframe with two columns, first a column with the contact's name (first last) and second the contact's email address.
#'
#' @param metadata an EML formatted R object
#'
#' @return dataframe
#' @keywords private
#' @noRd
#'
#' @examples
#' \dontrun{
#' contacts <- get_contacts(metadata)
#' }
.get_contacts <- function(metadata){
  contact <- metadata$dataset$contact
  individual <- NULL
  email <- NULL
  
  #if single contact, nest it so that it behaves the same as when there are
  #multiple contacts:
  if ("organizationName" %in% names(contact) |
      "individualName" %in% names(contact)) {
    contact <- list(contact)
  }
  
  for(i in 1:length(seq_along(contact))){
    #get name as first-last:
    name_list <- unlist(contact[[i]]$individualName, recursive = FALSE)
    if(length(seq_along(name_list)) == 3){
      ind_name <- paste(name_list$givenName1,
                        name_list$givenName2,
                        name_list$surName,
                        sep =" ")
    } else if (length(seq_along(name_list)) == 2){
      ind_name <- paste(name_list[1],
                        name_list[2],
                        sep =" ")
    } else {
      ind_name <- name_list
    }
    individual <- append(individual, ind_name)
    email <- append(email, contact[[i]]$electronicMailAddress)
  }
  contact_df <- data.frame(individual, email)
  names(contact_df)[1] = "contact"
  return(contact_df)
}


