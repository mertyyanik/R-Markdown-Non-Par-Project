---
title: "Parametrik Olmayan İstatistiksel Yöntemler Dönem Ödevi"
author: "Mert Yanık"
number: "21522134"
---
Oluşturulan bütün kodlar, çıktılar ve Word dosyası RStudio içerisinde bulunan R Markdown ile oluşturulmuştur.
Elimizde 2 farklı veri kümesi vardır. Bunlardan biri bağımsız diğeri bağımlı veri kümesidir.

Not: Çıktılar için kod bloklarını çalıştırmanız gerekmektedir.

# Soru 1
Birinci soruda bizden en az 3 bağımsız gruptan oluşan bir veri kümesi bulmamız ve her bir değişkeninin Normal dağılmadığını göstermemiz istenmektedir.
Aşağıda bu veri kümesinin RStudio'ya okutuluşu ve ekrana basılması için gerekli kodlar yazılmıştır.

```{r Bağımsız Veri Okuma, echo=TRUE, message=FALSE, warning=FALSE, paged.print=TRUE}
Bagimsiz <- read.delim("C:/Users/user/Desktop/NonPar/Bagimsiz.txt")
attach(Bagimsiz)
print(Bagimsiz)
```

Veri kümesi, kalite kontrolü yapmak amacı ile aynı üretimi yapan üç ayrı makineden (A, B, C) sırasıyla 6, 3 ve 5 tane olmak üzere ürünleri ele almaktadır. Burada puanların az olması dayanıklılığın daha zayıf olduğunu göstermektedir.

Bu verilere dair özetleyici istatistiklere bakalım.
```{r Tanımlayıcı İstatistikler, echo=TRUE, message=FALSE, warning=FALSE}
summary(Bagimsiz)
```

Elimizde ki 3 değişkeninde minimum - maksimum değerleri, çeyreklik değerleri ve ortalamaları görülmektedir. Bu noktada ortalama değer ile medyan değerinin birbirine olan yakınlığı veya uzaklığı ile Normal Dağılım çıkarsaması yapılabilir.

Şimdi elimizde ki 3 değişkenin tamamının Normal dağılmadığını gösterelim.

```{r Normal Dağılım, echo=TRUE, message=FALSE, warning=FALSE}
shapiro.test(A.Makinesi)
shapiro.test(B.Makinesi)
shapiro.test(C.Makinesi)
```

Kod çıktılarında görüldüğü üzere bütün P-Value değerleri, alfa değeri olan 0.05 den küçüktür. Bu da elimizde ki 3 değişkeninde  Normal dağılmadığı anlamına gelmektedir.

# Soru 2
İkinci soruda bizden en az 3 bağımlı gruptan oluşan bir veri kümesi bulmamız ve her bir değişkeninin Normal dağılmadığını göstermemiz istenmektedir.
Aşağıda kodların ekrana basımı gösterilmektedir.

```{r Bağımlı Veri Okuma, echo=TRUE, message=FALSE, warning=FALSE}
Bagimli <- read.delim("C:/Users/user/Desktop/NonPar/Bagimli.txt")
attach(Bagimli)
print(Bagimli)
```

Veri kümesi, laboratuvar farelerinin besin alma üstünlüğünün ölçülmesinde farklı hareket düzeyleri etkilerinin ölçülmesi için bir araştırmayı temel almaktadır. 5 erkek fare 0, 24 ve 72 saat aç bırakılarak yedikleri besin miktarı gram olarak ölçülmüştür.

```{r Tanımayıcı İstatistikler, echo=TRUE, message=FALSE, warning=FALSE}
summary(Bagimsiz)
```

Soru 1'de olduğu gibi tanımlayıcı istatistikler yukarıda görülmektedir. Yine burada da medyan değer ve ortalama değerini kıyaslayarak Normal dağılım çıkarsaması yapılabilir fakat bunun için özel olarak geliştirilmiş yöntemleri kullanmak daha mantıklıdır.

Gerekli testleri kullanarak elimizde ki 3 değişkenin Normal dağılmadığını gösterelim.

```{r Normal Dagılım, echo=TRUE, message=FALSE, warning=FALSE}
shapiro.test(Saat0)
shapiro.test(Saat24)
shapiro.test(Saat72)
```

Kod çıktılarında görüldüğü üzere bütün P-Value değerleri, alfa değeri olan 0.05 den küçüktür. Bu da elimizde ki 3 değişkeninde Normal dağılmadığı anlamına gelmektedir.

# Soru 3
Bu soruda bağımsız veri kümemizden herhangi bir değişken seçilip, o değişken üzerinde İşaret ve Wilcoxon İşaret Sıra Sayıları testlerini uygulamamız istenmektedir.

Seçtiğimiz değişken A Makinesi olsun. A Makinesinin medyan değerinin 350'ye eşit olup olmadığını test edelim.

Bu durumda;

H0 Hipotezi:A Makinesinin medyan değeri 350'ye eşittir.

HS Hipotezi:A Makinesinin medyan değeri 350'ye eşit değildir.

```{r Bağımsız Tek Örneklem İşaret Testi, echo=TRUE, message=FALSE, warning=FALSE}
library(DescTools)
SignTest(A.Makinesi,mu=350)
```

Yukarıda ki test işaret testidir. Bu test sonucu çıkan P-Value değeri 0.6875'tir. Yani alfa değeri olan 0.05'ten büyük çıktığı için H0 hipotezi kabul edilir. %95 güven düzeyinde A Makinesinin medyan değerinin 350'ye eşit olduğunu söyleyebiliriz.

Şimdi Wilcoxon testini uygulayalım.

```{r Bağımsız Tek Örneklem Wilcoxon, echo=TRUE, message=FALSE, warning=FALSE}
library(stats)
wilcox.test(A.Makinesi,mu=350)
```

Wilcoxon testinde P-Value değeri 0.2918 çıkmıştır. Aynı şekilde alfa değerinden büyük olduğu için H0 hipotezini kabul edebiliriz. İşaret testi ile Wilcoxon testlerinin aynı sonuca ulaştığı görülmektedir.

# Soru 4
Dördüncü soruda bağımsız veriye dair gerekli hipotezleri oluşturduktan sonra seçilen iki grup arasında konum yönünden farklılık olup olmadığını test etmemiz istenmektedir.

Bunun için A Makinesi ve B Makinesini ele alalım.

H0 Hipotezi:A Makinesi ve B Makinesi arasında konum yönünden farklılık yoktur.

HS Hipotezi:A Makinesi ve B Makinesi arasında konum yönünden farklılık vardır.

```{r Bagimsiz 2 Orneklem, echo=TRUE, message=FALSE, warning=FALSE}
library(stats)
wilcox.test(A.Makinesi,B.Makinesi,paired = FALSE)
```

Çıkan sonuca göre P-Value=0.02624 < alfa=0.05'tir. Dolayısıyla H0 Hipotezi ret edilir. Yani 2 grup arasında konum yönünden farklılık olduğunu %95 güven düzeyinde söyleyebiliriz.

# Soru 5
Beşinci soruda bağımlı veriye dair gerekli hipotezleri oluşturduktan sonra seçilen iki grup arasında konum yönünden farklılık olup olmadığını test etmemiz istenmektedir.

Bunun için 24.Saat ve 72.Saati ele alalım.

H0 Hipotezi:Farelere uygulanan deneyde 24.Saat ile 72.Saat arasında konum yönünden farklılık yoktur.

HS Hipotezi:Farelere uygulanan deneyde 24.Saat ile 72.Saat arasında konum yönünden farklılık vardır.

```{r Bagimli 2 Orneklem, echo=TRUE, message=FALSE, warning=FALSE}
library(stats)
wilcox.test(Saat24,Saat72,paired = TRUE)
```

Sonuçta görüldüğü üzere p-value=0.125 > alfa=0.05'dir. Bu durumda H0 Hipotezi kabul edilebilir. Yani farelere uygulanan deneyde 24.Saat ile 72.Saat arasında konum yönünden farklılık olmadığını %95 güven düzeyinde söyleyebiliriz.

# Soru 6
Bu soruda birinci soruda hazırlamış olduğumuz bağımsız veri kümesinde ki değişkenlerin konum yönünden farklı olup olmadığı araştırılmak istenmektedir.

Bunun için Kruskal-Wallis Testini uygulayacağız.

H0 Hipotezi : Kalite kontrolü yapmak amacı ile üretilen makineler arasında fark yoktur.

HS Hipotezi : Kalite kontrolü yapmak amacı ile üretilen makinelerden en az biri farklıdır.

```{r Kruskal-Wallis, echo=TRUE, message=FALSE, warning=FALSE}
library(stats)
library(PMCMRplus)
attach(Bagimsiz)
kruskal.test(Bagimsiz)
```

Sonuçta görüldüğü üzere P-Value değeri 0.06 > alfa = 0.05 olduğu için H0 Hipotezi kabul edilir yani makieneler arasında fark olmadığını %95 güven düzeyinde söyleyebiliriz. Bu durumda farklılığı yaratan grup olmadığı için Post-Hoc testlerini uygulamaya gerek yoktur.

# Soru 7
Bu soruda ikinci soruda hazırlamış olduğumuz bağımlı veri kümesinde ki değişkenlerin konum yönünden farklı olup olmadığı araştırılmak istenmektedir.

Bunun için Friedman Testini kullanacağız.

R, Friedman testini çalıştırmamız için bir matris kullanmamızı istemektedir.

```{r Veri Türü, echo=TRUE, message=FALSE, warning=FALSE}
class(Bagimli)
```

Görüldüğü üzere bizim veri kümemiz bir data frame'dir. Bu durumda bu veri kümesini matris haline getirmemiz ve testi bu şekilde yapmamız gerekmektedir. Aşağıda bunun nasıl yapıldığı ve daha sonrasında Friedman testinin sonucu görülmektedir.

H0 Hipotezi : Farelerin hareket düzeylerinde zamanın bir etkisi yoktur.

HS Hipotezi : Farelerin hareket düzeylerinde zamanın etkisi vardır.


```{r Friedman Testi, echo=TRUE, message=FALSE, warning=FALSE}
attach(Bagimli)
forFriedman=matrix(c(Bagimli[,1],Bagimli[,2],Bagimli[,3]),nrow = 5,
                   dimnames = list(1:5,c("0.Saat","24.Saat","72.Saat")))
friedman.test(forFriedman)
```

Sonuçta görüldüğü üzere P-Value değerimiz 0.07 > alfa=0.05 yani H0 Hipotezimiz kabul edilir. Farelerin hareket düzeylerinde zamanın bir etkisinin olmadığını söyleyebiliriz. Bu durumda farklılık yaratan grubu bulmamıza gerek yoktur.

