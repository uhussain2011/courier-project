<?php

//uploads file
trait  Fileupload
{
    public  function Savefile($file)
    {
        $_FILES = $file;
        
        if (isset($_FILES['file']['name'])) {
            $errors = array();
            $file_name = $_FILES['file']['name'];
            $file_size = $_FILES['file']['size'];
            $file_tmp = $_FILES['file']['tmp_name'];

            $file_ext = explode('.', $_FILES['file']['name']);
             $path = 'public/files/'.time().'.'.end($file_ext);
            if ($file_size > 2097152) {
                $errors[] = 'File size must be excately 2 MB';
            }

            if (empty($errors) == true) {
                move_uploaded_file($file_tmp,$path);
                return $path;
            } else {
                return null;
            }
        }
        return null;
    }
}