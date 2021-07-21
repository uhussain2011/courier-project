<?php
$base_path = '/delivery/';
session_start();

class Info_class {

    function route($path,$id) {
        return $path.'?id='.$id;
        
    }
}

