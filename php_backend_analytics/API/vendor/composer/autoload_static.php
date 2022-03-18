<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit5424217f27d5b6edbacbb6d413e0bd4b
{
    public static $prefixLengthsPsr4 = array (
        'F' => 
        array (
            'Firebase\\JWT\\' => 13,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Firebase\\JWT\\' => 
        array (
            0 => __DIR__ . '/..' . '/firebase/php-jwt/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit5424217f27d5b6edbacbb6d413e0bd4b::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit5424217f27d5b6edbacbb6d413e0bd4b::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
