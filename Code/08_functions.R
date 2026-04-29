#my functions

somma=function(x,y) {   #x e y sono gli argomenti
  z=x+y           
  return(z)        #output
}

differenza=function(x,y) {   
  z=x-y           
  return(z)       
}

#par(mfrow=c(1,2)) with default (1,2) (otherwise just function(nx,ny))
mf=function(nx=1, ny=2){
  par(mfrow=c(nx, ny))
  }

#struttura if else
numeri=function (x){
  if(x>0){
    print("positivo?")
    }
  else{
    print("negativo")
    }
  }

numeri=function (x){
  if(x>0){
    print("positivo?")
    }
  else if(x<0){
    print("negativo")
    }
    else{
      print("zero")
      }
  }

#for loop
loop=function(){
  for(i in 1:10){
    print(i)
    }
  }
loop()

loop2=function(){
  for(i in 1:10){
    op=i*2
    print(op)
    }
  }

loop3=function(){
  for(i in 1:10000){
    op=i^3*2
    print(op)
    }
  }






