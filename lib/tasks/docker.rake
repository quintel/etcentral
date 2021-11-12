namespace :docker do
  task :build do
    sh 'docker build . -t etcentral:latest'
  end

  desc 'Builds and publishes the image to Docker Hub'
  task release: [:build] do
    sh 'docker tag etcentral:latest quintel/etcentral:latest'
    sh 'docker push quintel/etcentral:latest'
  end
end
