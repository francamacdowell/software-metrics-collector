
# How to collect Software Metrics with Understand

This is a simple tutorial, showing the steps to collect software metrics from any Java GitHub project.

## Steps:
1. [Download Understand from SciTools](#1.-Download-Understand-from-SciTools)
2. [Clone GitHub Java project](#2.-Clone-GitHub-Java-project)
3. [Collect all commits' hash](#3.-Collect-all-commits'-hash)
4. [Run a bash script called _"metrics.sh"_](#4.-Run-a-bash-script-called-"metrics.sh")

## 1. Download Understand from SciTools
Basically, here you are going to download Understand and install on your respectively OS. <br>
***
Link to Download understand: https://scitools.com/download-2/ <br>
Link to tutorial to install and run Understand downloaded on __Linux__: https://scitools.com/documents/unix_install.php
***
After we will use it to extract software metrics.

## 2. Clone GitHub Java project

Clone repository you want to collect the software metrics.

For example: _git clone_ https://github.com/elastic/elasticsearch-hadoop.git

You will need pass the repository's path after. <br>
For example, in my computer the path to the project is: __/home/macdowell/pesquisa/software-metrics-TUTORIAL/elasticsearch-hadoop__

## 3. Collect all commits' hash

On this step, you will need to collect all commits' hash (string which is the reference to a commit) of the cloned project and save in one file called _"commits.txt"_.

It can be done in several ways. Going to approach this problem using terminal command _git log_ with parameters to format and outputs in _commits.txt_ file.

__Note: On terminal you must be in the same directory of GitHub project to use _git_ commands.__
***
Example:


_git log --pretty=format:"%H" > /home/macdowell/pesquisa/software-metrics-TUTORIAL/commits.txt_

With this, I get all commits' hash from the git project, one by line, saved in a file called _commits.txt_.
***

## 4. Run a bash script called _"metrics.sh"_

On this step, let's create a folder containing: __metrics.sh__ file, __commits.txt__ file and scitools' folder (result of step 1).

Opening the _script.sh_ you will see on line 3 an assignment. You have to assign the full path to the Git cloned repository, for example:

__repository=/pesquisa/software-metrics-TUTORIAL/elasticsearch-hadoop/__ 

The last bar is extremelly important.

Now you run the bash script with the command: _bash metrics.sh_
### Output files:

The output will be: .csv files.

One csv file by commit of project will be generated with __columns__ referent to the metrics and __rows__ referent to the each element to the project (e.g classes, methods, packages).
