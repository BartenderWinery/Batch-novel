# Batch-novel
 A experiment to fit a entire visual novel game on a single batch file.

# How it was done
 I was a bit dishonest, unless I had hundreds of lines of code. I couldn't make it completely only one script. Instead, I made the novel files CMD scripts that load the content to the novel script and takes it from there. They also load the images and pass it to the novel script. So not entirely only one script, but not necessary a multi-script program. Think of it as paths. I'll aim to remove this limitation in the future and change the method.

 You are able to have multiple windows of different "scripts" with only one batch file is by classifying the loading and settings into their own statements at the beginning of the script. The functions have to be outside of the statement of course, or it doesn't work. 

 The entire thing is very simple and easily reproducable. Batch is just a little weird.

 The novel files, when converted back into cmd. Are completely runnable by themselves. The novel script only giving it extra functions such as console, restoring back to novel, and easy access to other novels.

# Modding
 .novel files are simply cmd files renamed. You can create paths however you want and mod it to whatever you want to. Any echos are passed over to the main window.

# Future features
 1. Colors
 2. Scalable interface
 3. In-window novel creation
 4. And much more