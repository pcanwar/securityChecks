# securityChecks
Simple security tools check for an administrator to do:


1- Password file entry checking - go through each line of the password file. If the entry is for a normal user (it has a UID > 500 or is the root account) it checks three things:
a) The listed shell is actually a valid shell as given in the file /etc/shells. (b) The home directory has permissions 700. (c) The user is not a member of group 0.
If the entry is for a non-normal user, it checks: (a) The listed shell is not in the file /etc/shells, except for that of the root account which is in /etc/shells. (b) The root account is a member of group 0, others are not. (c) The root account has UID 0. Global checks to make include: (a) There are no repeated user names in the password file. (b) There are no repeated UID values in the password file. (c) There are no repeated group names in the group file. (d) There are no repeated GID values in the group file.Print an error report about anything wrong determined for each user.


2- Process checking - it checks the list of currently executing processes (using ps) to see if any of them are "bad". A process is considered bad if: (a) its CPU usage is greater than 75% (b) its memory usage is greater than 25% (c) its total execution time has exceeded 1 hour. For any bad processes found to be running, it generates an output line in the format: pid process_name user_name time_started CPU% total_running_time MEM% These lines is sorted by process id.


3- PATH check - do checks related to the PATH variable. First check to see if the PATH contains . (current directory) and give an error message if it does. It checks the executable programs in each of the directories specified by PATH. It checks to see which programs have the setuid bit turned on and which have write permission for anyone other than the user owner. The output  consist of three lists of problematic files given by their full path names: (a) those with the setuid bit on and writable by non-owner first, (b) those with the setuid bit on but only writable by the owner second, and (c) those with the setuid bit off and writable by non-owner last. Each group of file names is sorted alphabetically.


4- /etc directory check - the contents of the /etc directory is be checked for problems: (a) Check for any files that have write access by anyone other than root. Display problem files with their name, owner's name and permissions, alphabetically ordered by file name. (b) Check if any files have been modified since 6pm the previous day. List these by file name and time modified, sorted by modify time. (c) Check if any files have had their properties changed since 6pm the previous day. List these by file name and time changed, sorted by change time.


5- Log processing - the contents of a web log file are attached above. It processes the set of web requests looking for error situations, where the http status code returned is 400 or greater. For these bad requests, making two reports: (a) A list of files involved in the bad requests, sorted by file name, with a count of how many times each file was involved in a bad request. (b) A list of computers involved in the bad requests, with a count of how many times each computer made a bad request, sorted by frequency of bad requests.

