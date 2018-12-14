#!/bin/bash

repository=/home/macdowell/pesquisa/elasticsearch-hadoop/ # The last bar is extremelly important

while read commit; do

  git --git-dir=${repository}.git --work-tree=${repository} reset --hard ${commit}

  echo $repository
			
  echo "Creating the project ${commit}..."
  ./scitools/bin/linux64/und create -db ${commit}.udb -languages java	
  
  echo "Adding file to the commit: ${commit}.."
  ./scitools/bin/linux64/und -db ${commit}.udb add $repository
  
  echo "Analysing commit: ${commit}..."
  echo "./scitools/bin/linux64/und analyze -db ${commit}.udb"
  ./scitools/bin/linux64/und analyze -db ${commit}.udb

  echo "Adding metrics: ${commit}"   
  ./scitools/bin/linux64/und settings -metricmetricsAdd all ${commit}.udb
  
  ./scitools/bin/linux64/und settings -MetricFileNameDisplayMode RelativePath ${commit}.udb
  ./scitools/bin/linux64/und settings -MetricDeclaredInFileDisplayMode RelativePath ${commit}.udb
  ./scitools/bin/linux64/und settings -MetricShowDeclaredInFile on ${commit}.udb
  ./scitools/bin/linux64/und settings -MetricShowFunctionParameterTypes on ${commit}.udb
  
  # Project settings
  #./scitools/bin/linux64/und list -metrics settings ${commit}.udb
     
  echo "Calculating metrics ${commit}"
  ./scitools/bin/linux64/und metrics ${commit}.udb
			
  echo "Removing project files ${commit}"
  rm ${commit}.udb
  
done < commits.txt
