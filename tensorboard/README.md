

'''
 docker build -t tensorboard .
 
Run it with: 

 docker run -p 6006:6006  -v $(pwd):/mounted tensorboard

or even simpler: 

 docker run -p 6006:6006  -v $(pwd):/mounted rmeertens/tensorboard

'''
