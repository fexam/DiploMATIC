 (define (simple-unsharp-mask filename
                              radius
			      amount
			      threshold)
   (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
          (drawable (car (gimp-image-get-active-layer image))))
     (plug-in-unsharp-mask RUN-NONINTERACTIVE
	                   image drawable radius amount threshold)
     (gimp-file-save RUN-NONINTERACTIVE image drawable filename filename)
     (gimp-image-delete image)))

#|
This is a simple scheme script that does something. To use, place this file in ~/.gimp-2.6/scripts. Then navigate to the folder containing the image you want to manipulate, and run the following command:

  gimp -i -b '(simple-unsharp-mask "foo.png" 5.0 0.5 0)' -b '(gimp-quit 0)'
|#
