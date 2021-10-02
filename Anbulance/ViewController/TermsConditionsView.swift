//
//  TermsConditionsView.swift
//  Anbulance
//
//  Created by Selen Yanar on 2.10.2021.
//

import SwiftUI

struct TermsConditionsView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text("Kullanım Koşulları")
                Text("Son güncellenme: 02/10/2021")
                Spacer()
                Text("Sevgili ziyaretçimiz, lütfen Anbulance uygulamamıza kayıt olmadan önce işbu kullanım koşulları sözleşmesini dikkatlice okuyunuz. Siteye erişiminiz tamamen bu sözleşmeyi kabulünüze ve bu sözleşme ile belirlenen şartlara uymanıza bağlıdır. Şayet bu sözleşmede yazan herhangi bir koşulu kabul etmiyorsanız, lütfen siteye erişiminizi sonlandırınız. Siteye erişiminizi sürdürdüğünüz takdirde, koşulsuz ve kısıtlamasız olarak, işbu sözleşme metninin tamamını kabul ettiğinizin, tarafımızca varsayılacağını lütfen unutmayınız.")
                Text("Anbulance uygulaması Selen Yanar tarafından yönetilmekte olup, bundan sonra UYGULAMA olarak anılacaktır. İşbu siteye ilişkin Kullanım Koşulları, yayınlanmakla yürürlüğe girer. Değişiklik yapma hakkı, tek taraflı olarak UYGULAMA'ya aittir ve UYGULAMA üzerinden güncel olarak paylaşılacak olan bu değişiklikleri, tüm kullanıcılarımız baştan kabul etmiş sayılır.")
                Spacer()
            }
            
            VStack {
                Text("Gizlilik")
                Text("Gizlilik, ayrı bir sayfada, kişisel verilerinizin tarafımızca işlenmesinin esaslarını düzenlemek üzere mevcuttur. UYGULAMA'yı kullandığınız takdirde, bu verilerin işlenmesinin gizlilik politikasına uygun olarak gerçekleştiğini kabul edersiniz.")
                Spacer()
                Text("Hizmet Kapsamı")
                Text("Selen Yanar olarak, sunacağımız hizmetlerin kapsamını ve niteliğini, yasalar çerçevesinde belirlemekte tamamen serbest olup; hizmetlere ilişkin yapacağımız değişiklikler, UYGULAMA'da yayınlanmakla yürürlüğe girmiş sayılacaktır.")
                Spacer()
                Text("Telif Hakları")
                Text("UYGULAMA'da yayınlanan tüm metin, kod, grafikler, logolar, resimler, ses dosyaları ve kullanılan yazılımın sahibi (bundan böyle ve daha sonra 'içerik' olarak anılacaktır) Selen Yanar olup, tüm hakları saklıdır. Yazılı izin olmaksızın site içeriğinin çoğaltılması veya kopyalanması kesinlikle yasaktır.")
                Spacer()
                Text("Genel Hükümler")
            }
            
            VStack {
                Spacer()
                Text("•    Kullanıcıların tamamı, UYGULAMA'yı yalnızca hukuka uygun ve şahsi amaçlarla kullanacaklarını ve üçüncü kişinin haklarına tecavüz teşkil edecek nitelikteki herhangi bir faaliyette bulunmayacağını taahhüt eder. UYGULAMA dahilinde yaptıkları işlem ve eylemlerindeki, hukuki ve cezai sorumlulukları kendilerine aittir. İşbu iş ve eylemler sebebiyle, üçüncü kişilerin uğradıkları veya uğrayabilecekleri zararlardan dolayı UYGULAMA'nin doğrudan ve/veya dolaylı hiçbir sorumluluğu yoktur.")
                Text("•    UYGULAMA'de mevcut bilgilerin doğruluk ve güncelliğini sağlamak için elimizden geleni yapmaktayız. Lakin gösterdiğimiz çabaya rağmen, bu bilgiler, fiili değişikliklerin gerisinde kalabilir, birtakım farklılıklar olabilir. Bu sebeple, site içerisinde yer alan bilgilerin doğruluğu ve güncelliği ile ilgili tarafımızca, açık veya zımni, herhangi bir garanti verilmemekte, hiçbir taahhütte bulunulmamaktadır.")
                Text("•    UYGULAMA'de üçüncü şahıslar tarafından işletilen ve içerikleri tarafımızca bilinmeyen diğer web sitelerine, uygulamalara ve platformlara köprüler (hyperlink) bulunabilir. UYGULAMA, işlevsellik yalnızca bu sitelere ulaşımı sağlamakta olup, içerikleri ile ilgili hiçbir sorumluluk kabul etmemekteyiz.")
                Text("•    UYGULAMA'yi virüslerden temizlenmiş tutmak konusunda elimizden geleni yapsak da, virüslerin tamamen bulunmadığı garantisini vermemekteyiz. Bu nedenle veri indirirken, virüslere karşı gerekli önlemi almak, kullanıcıların sorumluluğundadır. Virüs vb. kötü amaçlı programlar, kodlar veya materyallerin sebep olabileceği zararlardan dolayı sorumluluk kabul etmemekteyiz.")
                Text("•    UYGULAMA'de sunulan hizmetlerde, kusur veya hata olmayacağına ya da kesintisiz hizmet verileceğine dair garanti vermemekteyiz. UYGULAMA'ye ve sitenin hizmetlerine veya herhangi bir bölümüne olan erişiminizi önceden bildirmeksizin herhangi bir zamanda sonlandırabiliriz.")
                
            }
            
            VStack {
                
                Spacer()
                Text("Sorumluluğun Sınırlandırılması")
                Spacer()
                Text("UYGULAMA'nin kullanımından doğan zararlara ilişkin sorumluluğumuz, kast ve ağır ihmal ile sınırlıdır. Sözleşmenin ihlalinden doğan zararlarda, talep edilebilecek toplam tazminat, öngörülebilir hasarlar ile sınırlıdır. Yukarıda bahsedilen sorumluluk sınırlamaları aynı zamanda insan hayatına, bedeni yaralanmaya veya bir kişinin sağlığına gelebilecek zararlar durumunda geçerli değildir. Hukuken mücbir sebep sayılan tüm durumlarda, gecikme, ifa etmeme veya temerrütten dolayı, herhangi bir tazminat yükümlülüğümüz doğmayacaktır.")
                Spacer()
                Text("Uyuşmazlık Çözümü: İşbu Sözleşme'nin uygulanmasından veya yorumlanmasından doğacak her türlü uyuşmazlığın çözümünde, Türkiye Cumhuriyeti yasaları uygulanır; İstanbul Adliyesi Mahkemeleri ve İcra Daireleri yetkilidir.")
                
            }
            
            
            
        }
        .background(Color(.white))
        .foregroundColor(.black)
        .padding()
        
        Button(action: {presentationMode.wrappedValue.dismiss()},
               label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 300, height: 50, alignment: .center)
                        .foregroundColor(Color("AnbulanceBlue"))
                        .cornerRadius(8)
                    Text("Okudum")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
        })
    }
}

struct TermsConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsConditionsView()
    }
}
