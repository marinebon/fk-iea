# reads rds from remote source.
# assumes file has static content and will not re-download
read_rds_remote = function(
    remote_url, fname
){
    if (!all(file.exists(fname))){
        download.file(
            remote_url,
            fname,
            method="wget"
        )
    }
    return(read_rds(fname))
}
