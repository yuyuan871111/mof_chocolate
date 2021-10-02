# Project: mof_chocolate 
## 起源
這是2018年由四位大學部同學（謝文瑜、楊淯元、楊雅惠、周信呈）共同在暑期製作的一個project。由國立陽明大學（現國立陽明交通大學）生物醫學資訊研究所楊永正老師指導，並由生物資訊組各位學長姐協助，在此特別感謝蔡博、james、琦瑋、薰文、鴻青的幫助，讓我們能順利完成整個project。</br>
專案名字源於實習桌上的零食——巧克力，因為當時大家陷入思索名字的迴圈中，為了趕緊跳出，取了一個手邊有的物品當作暫時的專案名稱，也因此沿用到現在了。而mof的開頭只是PM周信呈隨意按了鍵盤以增加巧克力專案的辨識度所設計的。</br>
## 專案目標
由於近年研究指出，腸道中微生物相(microbiota)與人體會有交互作用，進而影響到人體健康。而環境中，土壤、水源、植物周邊等，都有可能形成不同的微生物相，使得各地點表現的生態及環境皆有所不同。然而，在分析微生物相的過程當中，需要了解該環境中的微生物種類，過往常需要透過微生物、醫生以經驗上來做斷定微生物種類，並需要透過分菌流程的設計，透過不同實驗進行菌種的分類。我們希望實做出一個提供互動式的「資訊儀表板」，使得欲研究「微生物相」的使用者，提供微生物的資料，並提供一個分菌的流程以供參考，可以精準的讓使用者了解到需要什麼流程才能分類出不同的菌。</br>
專案主要分為兩階段，本次專案以Bergey's Manual Vol. 3 - The Firmicutes 為例，建構出一套流程，並提供原始碼，若有微生物資料庫建構需求的程式開發者，可以去做參考。
* 第一階段：資料清理與整理  
  > 將PDF文檔 Bergey's Manual (以 Vol. 3 - The Firmicutes 為例）的上的「微生物資料」，變成實際格式化可用的「微生物資訊」。
* 第二階段：資訊呈現與分析
  > 將「第一階段」蒐集、整理、清理而得到的「資訊」，設計成「資訊儀表板」來呈現。
  > 資訊儀表板提供了三項功能
  > 1. 可從菌屬來做特性檢索與比較
  > 2. 可從特性去檢索潛在菌屬並比較
  > 3. 透過伯傑氏細菌鑑定手冊中已知的生化特性測試，自動化規劃出多菌種的分菌流程

## 專案成果
### 1. 專案報告
詳細的專案報告編寫於Evernote，如下<a href="https://www.evernote.com/shard/s317/client/snv?noteGuid=15869be0-074d-44d5-a69d-ea30dff8ad35&noteKey=58348029ad89b0b1&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs317%2Fsh%2F15869be0-074d-44d5-a69d-ea30dff8ad35%2F58348029ad89b0b1&title=%253C99%253E%2B%25E5%25AF%25A6%25E7%25BF%2592%25E7%25B5%2590%25E6%259E%259C%25E5%25A0%25B1%25E5%2591%258A">網址</a>可以前往觀看。  

### 2. 專案成果的儀表板
如下<a href="http://120.126.47.90/MOF">網址</a>，可前往觀看。  

### 3. 本地端(local)的下載使用  
#### (1) Docker (單純想使用資料庫，建構時間約10分鐘） 
請事先裝好<a href="https://git-scm.com/download/mac">git</a>以及<a href="https://www.docker.com/products/docker-desktop">docker</a>  

第一步：下載  
執行`git clone https://github.com/yuyuan871111/mof_chocolate`  

第二步：建構資料庫  
執行`docker build -t mof_chocolate_app .`  
> FORMAT: `docker build [OPTIONS] PATH`  
> FLAG: `-t mof_chocolate`: 程式名稱（IMAGE, 可自訂名稱） 
  
第三步：執行程式  
執行`docker run -p 7421:7421 mof_chocolate_app`  
> FORMAT: `docker run [OPTIONS] IMAGE`  
> FLAG: `-p 7421:7421`: 轉接埠(port, 不可變更)  
  
第四步：使用資料庫  
打開瀏覽器輸入`http://localhost:7421`便可以順利使用  

#### (2) Conda (更改資料庫架構、外觀等等）
請事先裝好<a href="https://git-scm.com/download/mac">git</a>以及<a href="https://docs.conda.io/en/latest/miniconda.html">miniconda</a>  

第一步：下載  
執行`git clone https://github.com/yuyuan871111/mof_chocolate`  
執行`cd mof_chocolate`  

第二步：conda環境建構（可能需要30min~1hr)  
執行`conda env create -f mof_chocolate/env.yml`  

第三步：啟動環境  
執行`conda activate mof_build`  
  
第四步：啟動程式  
執行`Rscript app.R`或使用RStudio開啟Dashboard資料夾並執行app  

第五步：使用資料庫  
打開瀏覽器輸入`http://localhost:7421`便可以順利使用  

