// Gruntfile.js
/* jshint node: true */
'use strict';
var path = require('path');

module.exports = function (grunt) {
    [
        'grunt-express-server',
        'grunt-contrib-handlebars',
        'grunt-contrib-clean',
        'grunt-contrib-coffee',
        'grunt-contrib-testem',
        'grunt-contrib-copy',
        'grunt-shell',
        'grunt-contrib-watch'
    ].forEach(grunt.loadNpmTasks);

    var
        handlebarTemplates = grunt.file.expandMapping(['src/js/templates/**/*.hbs'], 'build/js/templates/', {
            rename: function (destBase, destPath) {
                    return destPath.replace('src/js/templates', destBase).replace(/\.hbs$/, '.js');
                }
        }),

        coffeeSrc = grunt.file.expandMapping(['src/js/**/*.coffee'], 'build/js/', {
            rename: function (destBase, destPath) {
                    return destPath.replace('src/js', destBase).replace(/\.coffee$/, '.js');
                }
        }),
        coffeeSpecs = grunt.file.expandMapping(['specs/js/app/**/*.coffee'], 'build/js/specs/', {
            rename: function (destBase, destPath) {
                    return destPath.replace('specs/js/app', destBase).replace(/\.coffee$/, '.js');
                }
        });


    grunt.initConfig({
        //------------ BEGIN Expressjs -------------------
        express: {
            develop: {
                options: {
                    script: './config/server.js',
                    nospawn: true,
                    delay: 5
                }
            },
            test: {
                options: {
                    script: './config/server.js',
                    nospawn: true,
                    delay: 5
                }
            }
        },
        //------------ END Expressjs -------------------

        //------------ BEGIN Handlebars -------------------
        handlebars: {
            buildTemplates: {
                options: {
                    namespace: 'JST',
                    amd: true,
                    commonjs: false,
                    processName: function (filePath) {
                        var pieces = filePath.split('/');
                        return pieces[pieces.length - 1];
                    }
                },
                files: handlebarTemplates
            }
        },
        //------------ END Handlebars -------------------

        //------------ BEGIN CoffeeScript -------------------
        coffee: {
            build: {
                files: coffeeSrc
            },
            specs: {
                files: coffeeSpecs
            }
        },
        //------------ END CoffeeScript -------------------
        
        //------------ BEGIN mocha-phantomjs -------------------
        shell: {
            'mocha-phantomjs': {
                command: 'node_modules/mocha-phantomjs/bin/mocha-phantomjs http://localhost:9090/testRunner.html',
                options: {
                    stdout: true,
                    stderr: true
                }
            },
            express: {
                command: 'grunt express:develop',
                options: {
                    stdout: true,
                    stderr: true
                }
            }
        },
        //------------ END mocha-phantomjs -------------------
       
        //------------ BEGIN Watch -------------------
        watch: {
            specsJs: {
                files: ['src/js/**/*.coffee', 'build/js/specs/**/*.js', 'specs/js/**/*.coffee'],
                tasks: ['coffee', 'handlebars', 'shell:mocha-phantomjs']
            },
            specs: {
                files: ['specs/js/**/*.coffee'],
                tasks: ['coffee:specs', 'copy:specs']
            },
            run: {
                files: ['src/js/**/*.coffee', 'src/js/templates/**/*.js'],
                tasks: ['coffee:build', 'handlebars']
            }
        },
        //------------ END Watch -------------------
        
        //------------ BEGIN Copy -------------------
        copy: {
            publicHtml: {
                files: [
                    {expand: false, flatten: false, filter: 'isFile', src: ['src/index.html'], dest: 'build/index.html'},
                    {expand: false, flatten: false, filter: 'isFile', src: ['src/css/style.css'], dest: 'build/style.css'}
                ]
            },
            mainJs: {
                files: [
                    {expand: false, flatten: false, filter: 'isFile', src: ['src/js/Main.js'], dest: 'build/js/Main.js'}
                ]
            },
            specs: {
                files: [
                    {expand: false, flatten: false, filter: 'isFile', src: ['specs/js/Main.js'], dest: 'build/js/Main.js'},
                    {expand: false, flatten: false, filter: 'isFile', src: ['specs/testRunner.html'], dest: 'build/testRunner.html'},
                    {expand: false, flatten: false, filter: 'isFile', src: ['src/specs.html'], dest: 'build/specs.html'}
                ]
            }
        },
        //------------ END Copy ---------------------
        
        //------------ BEGIN Clean -------------------
        clean: {
            build: ['build']
        }
        //------------ END Clean -------------------
        
    });

    //--------------- BEGIN TASKS -----------------------
    grunt.registerTask(
        'handlebars:build',
        'Build handlebars templates',
        ['handlebars:buildTemplates']
    );

    grunt.registerTask(
        'run',
        'Run the application.',
        ['clean', 'coffee:build', 'handlebars', 'copy:publicHtml', 'copy:mainJs', 'express:develop', 'watch:run']
    );

    grunt.registerTask(
        'specs',
        'Run specs',
        ['clean', 'coffee', 'copy:specs', 'handlebars', 'express:test', 'shell:mocha-phantomjs', 'watch:specsJs']
    );
    //--------------- END TASKS -------------------------
};

