plot_csv  <- list.files("data/plot_data/", pattern = ".csv", full.names = T)
functions_name_slider <-  plot_csv %>% sub(".csv", "",.) %>% sub("^.*\\/\\/", "",.)
plot_data = plot_csv %>% map(read_csv)
names(plot_data) = functions_name_slider
plot_func = function(MAX,MIN,num_charac){
  Data = plot_data[[num_charac]]
  
  Data %<>%   mutate(max = replace(max,which(max > MAX),MAX))
  Data %<>%   mutate(min = replace(min,which(min < MIN),MIN))
  
  Data = 
    Data %>% mutate(mean = (min+max)/2) %>% 
    filter( !(max < MIN  | min > MAX) )
  num = NROW(Data)
  num_size = 850/num
  if(num_size >20){
    num_size = 20
  }
  p = ggplot(data = Data ,aes(Genus,mean,color = Genus))
  p + geom_errorbar(aes(ymin = min, ymax = max),size = 1,show.legend=F) + 
    theme(axis.text.y = element_text(size = num_size), axis.title = element_text(size = 20),
          axis.text.x = element_text(size = 20)) +
    ylab(num_charac) + 
     coord_flip()
}

slider_supl_txt <- read_lines("data/plot_data/note.txt")
slider_supl_txt <- rapply(as.list(slider_supl_txt), function(x){return(paste(x,"\n"))})




