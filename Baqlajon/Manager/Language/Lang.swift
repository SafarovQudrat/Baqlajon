//
//  Lang.swift
//  Baqlajon
//
//  Created by MacBook Pro on 08/04/23.
//

import Foundation
class Lang {
    static func getString(type:StringType)->String {
        
        switch Cache.getAppLanguage() {
            
        case .ru :
            switch type {
            case .startT1 : return "Найдите свой любимый курс"
            case .startT2: return "Учитесь с удовольствием"
            case .startT3:return "Получите хорошие результаты"
            case .startD1:return "Наши новые видео облегчают вам обучение в любом месте, есть новые видео, которые будут готовы помочь вам"
            case .welcome:return "Добро пожаловать!"
            case .welcomeNTf:return "Номер телефона"
            case .welcomeP: return "Пароль"
            case .welcomeFP:return "Забыли пароль"
            case .haveAccaunt: return "У вас нет аккаунта?"
            case .createAcc:return "Создавать Счет!"
            case .createNTF :return "Имя*"
            case .createLNTF :return "Фамилия*"
            case .createRC :return "Пароль"
            case .alHaveAcc:return "У вас уже есть аккаунт?"
            case .otpLbl:return "Пожалуйста, введите код, который мы отправили"
            case .forgotPassLbl:return "Пожалуйста, введите зарегистрированный номер телефона, чтобы сбросить пароль!"
            case .resetPassLbl:return "Введите новый пароль!"
            case .newPassTf:return "Новый пароль"
            case .confirmPassTf:return "Подтвердите пароль"
            case .payCTitle:return "Набор Lorem ipsum"
            case .payCText:return "Заплати 99 000 сум и получи полный доступ на месяц"
            case .yelloVText:return "Куплено:"
            case .alertPLbl:return "/На месяц"
            case .bHWTitle:return "Как это работает"
            case .infoB1:return "Зарегистрируйтесь и получите 1 монету"
            case .infoB2:return "Вы зарабатываете 1 монету за курс покупки"
            case .infoB3:return "Пригласи друга и получи 1 монету"
            case .shareTitle:return "Делитесь и получайте монеты"
            case .shareText:return "Поделитесь ссылкой и заработайте 5 монет"
            case .coin1:return "30 монет за регистрацию"
            case .coin2:return "60 монет на покупку курсов"
            case .coin3:return "30 монет за приглашение друзей"
            case .congTitle:return "Поздравляем!"
            case .congText:return  "Новые монеты"
            case .CongCText:return "Вы только что заработали"
            case .profilePay:return "История платежей"
            case .profileLang:return "Язык"
            case .profileDark:return "Темный режим"
            case .profileAbout:return "О нас"
            case .profileShare:return "Делиться"
            case .profileHelp:return "Помощь"
            case .EditNButton:return "Изменять"
            case .gender:return "Пол"
            case .dateB:return "Дата рождения"
            case .changePass:return "Изменить пароль"
            case .changNumLbl:return "Пожалуйста, введите ваш новый номер телефона"
            case .changeNumTf:return "Введите новый номер телефона"
            case .oldPass:return "Введите старый пароль"
            case .aboutUsT:return "О нас"
            case .aboutUsText:
                return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus.Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti socialsqu ad litora Torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Аликвам в элементум теллус."
         
            case .shopAlertText1:return  "Ваша заявка принята и мы свяжемся с вами в ближайшее время!"
            case .shopAlertText2:return "Извините, у вас недостаточно монет!Соберите больше монет."
            case .reviewLbl:return "Каков был ваш опыт работы с нами?"
            case .tabBarHome:
                return "Дом"
            case .tabBarCourse:
                return "Мои курсы"
            case .tabBarBalance:
                return "Баланс"
            case .tabbarProfile:
                return "Профиль"
            case .logOut:
                return "Выйти"
            case .homeBuyBtn:
                return "Купить"
            case .searchTf:
                return "Поиск"
            case .homeBtn1:
                return "Все"
            case .homeBtn2:
                return "Популярный"
            case .homeBtn3:
                return "Новейшие"
            case .continueBtn:
                return "Продолжать"
            case .myCourseBtn1:
                return "Все"
            case .myCourseBtn2:
                return "Непрерывный"
            case .myCourseBtn3:
                return "Завершенный"
            case .tLbl:
                return "Платите и накапливайте баллы,обменивайте накопленные баллы на все, что захотите"
            case .tBtn:
                return "Оплата"
            case .balanceBuyBtn:
                return "Купить"
            case .shareRefCode:
                return "Поделит реферал код"
            case .ClaimReward:
                return "Награда претензии"
            case .save:
                return "Сохранять"
            case .send:
                return "Отправлять"
            }
     
        case .uz:
            switch type {
            case .startT1 : return "Sevimli kursingizni toping"
            case .startT2: return "Xursandchilik bilan o'rganing"
            case .startT3:return "Yaxshi natijalarga erishing"
            case .startD1:return "Bizning yangi videolarimiz istalgan joyda o'rganishingizni osonlashtiradi, sizga yordam berishga tayyor bo'lgan yangi videolar mavjud"
            case .welcome:return "xush kelibsiz!"
            case .welcomeNTf:return "Telefon raqami"
            case .welcomeP: return "Parol"
            case .welcomeFP:return "Parolni unutdingizmi"
            case .haveAccaunt: return "Hisobingiz yo'qmi?"
            case .createAcc:return "Hisob yaratish!"
            case .createNTF :return "Ism*"
            case .createLNTF :return "Familiya*"
            case .createRC :return "Parol"
            case .alHaveAcc:return "Sizda allaqachon hisob bor?"
            case .otpLbl:return "Iltimos, biz yuborgan kodni kiriting"
            case .forgotPassLbl:return "Parolni tiklash uchun ro'yxatdan o'tgan telefon raqamingizni kiriting!"
            case .resetPassLbl:return "Yangi parolni kiriting!"
            case .newPassTf:return "Yangi parol"
            case .confirmPassTf:return "Confirm password"
            case .payCTitle:return "Lorem ipsum to'plami"
            case .payCText:return "99 000 so'm to'lang va bir oy davomida to'liq kirish huquqiga ega bo'ling"
            case .yelloVText:return "Sotib olinganlar:"
            case .alertPLbl:return "/Bir oyga"
            case .bHWTitle:return "U qanday ishlaydi"
            case .infoB1:return "Ro'yxatdan o'ting va 1 tanga oling"
            case .infoB2:return "Har bir kurs xaridi uchun 1 tanga olasiz"
            case .infoB3:return "Dostingizni taklif qiling va 1 tanga oling"
            case .shareTitle:return "Tangalarni baham ko'ring va oling"
            case .shareText:return "Havolani ulashing va 5 tanga ishlang"
            case .coin1:return "Ro'yxatdan o'tish uchun 30 tanga"
            case .coin2:return "Kurslarni sotib olish uchun 60 tanga"
            case .coin3:return "Do'stlarni taklif qilish uchun 30 tanga"
            case .congTitle:return "Tabriklaymiz!"
            case .congText:return  "Yangi tangalar"
            case .CongCText:return "endigina topdingiz"
            case .profilePay:return "To'lov tarixi"
            case .profileLang:return "Til"
            case .profileDark:return "Tungi rejim"
            case .profileAbout:return "Biz haqimizda"
            case .profileShare:return "Ulashish"
            case .profileHelp:return "Yordam"
            case .EditNButton:return "O'zgartirish"
            case .gender:return "Jins"
            case .dateB:return "Tug'ilgan kun"
            case .changePass:return "Parolni o'zgartirish"
            case .changNumLbl:return "Iltimos, yangi telefon raqamingizni kiriting"
            case .changeNumTf:return "Yangi telefon raqamini kiriting"
            case .oldPass:return "Eski parolni kiriting"
            case .aboutUsT:return "Biz haqimizda"
            case .aboutUsText:
                return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus.Maecenas eget condimentum velit, sit amet feugiat lectus. Sinf aptent taciti socialsqu ad litora Torquent per conubia nostra, per inceptos himenaeos. To'g'ridan-to'g'ri auctor purus luctus enim egestas, ac sclerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Tellus elementidagi aliquam."
         
            case .shopAlertText1:return  "Sizning arizangiz qabul qilindi va biz tez orada siz bilan bog'lanamiz!"
            case .shopAlertText2:return "Kechirasiz, sizda tangalar yetarli emas! Koʻproq tanga toʻplang."
            case .reviewLbl:return "Biz bilan tajribangiz qanday edi?"
            case .tabBarHome:
                return "Asosiy"
            case .tabBarCourse:
                return "Kurslarim"
            case .tabBarBalance:
                return "Hisob"
            case .tabbarProfile:
                return "Profil"
            case .logOut:
                return "Chiqish"
            case .homeBuyBtn:
                return "Sotib olish"
            case .searchTf:
               return "Qidirish"
            case .homeBtn1:
                return "Hammasi"
            case .homeBtn2:
                return "Mashhur"
            case .homeBtn3:
                return "Yangi"
            case .continueBtn:
                return "Davom etish"
            case .myCourseBtn1:
                return "Hammasi"
            case .myCourseBtn2:
                return "Jarayonda"
            case .myCourseBtn3:
                return "Tugallangan"
            case .tLbl:
                return "To’lov qiling va ball to’plang,to’lpagan ballaringizni istalgan narsangizga almashtiring"
            case .tBtn:
                return "Sotib olish"
            case .balanceBuyBtn:
                return "Sotib olish"
            case .shareRefCode:
                return "Referal kodni ulashish"
            case .ClaimReward:
                return "Mukofotni olish"
            case .save:
                return "Saqlash"
            case .send:
                return "Yuborish"
            }
        case .en:
            switch type {
            case .startT1 : return "Find your favorite course"
            case .startT2: return "Learn with fun"
            case .startT3:return "Get good results"
            case .startD1:return "Our new videos make it easy for you to learn anywhere, there are new videos that will be ready to help you"
            case .welcome:return "Welcome Back!"
            case .welcomeNTf:return "Phone number"
            case .welcomeP: return "Password"
            case .welcomeFP:return "Forgot Password"
            case .haveAccaunt: return "Don’t have an account? "
            case .createAcc:return "Create Accaount"
            case .createNTF :return "First name*"
            case .createLNTF :return "Last name*"
            case .createRC :return "Password"
            case .alHaveAcc:return "Already have an account? Login "
            case .otpLbl:return "Please, enter the code we sent "
            case .forgotPassLbl:return "Please enter your registered phone number to reset your password!"
            case .resetPassLbl:return "Enter a new password!"
            case .newPassTf:return "New password"
            case .confirmPassTf:return "Confirm password"
            case .payCTitle:return "Lorem ipsum set"
            case .payCText:return "Pay 99 000 UZS & get all access for a month"
            case .yelloVText:return "Purchased by:"
            case .alertPLbl:return "/For a month"
            case .bHWTitle:return "How it works"
            case .infoB1:return "You will get 1 coin for signing up"
            case .infoB2:return "You earn 1 coin for every buying course"
            case .infoB3:return "You will get 1 coin for every invited friend"
            case .shareTitle:return "Share and get coins"
            case .shareText:return "Share your referral link and earn 5 coins"
            case .coin1:return "30 coins for registration"
            case .coin2:return "60 coins for buying courses"
            case .coin3:return "30 coins for invite friends"
            case .congTitle:return "Congratulations!"
            case .congText:return  "New coins"
            case .CongCText:return "You have just earned "
            case .profilePay:return "Payments history"
            case .profileLang:return "Language"
            case .profileDark:return "Dark Mode"
            case .profileAbout:return "About us"
            case .profileShare:return "Share"
            case .profileHelp:return "Help"
            case .EditNButton:return "Change"
            case .gender:return "Gender"
            case .dateB:return "Date and birth"
            case .changePass:return "Change password"
            case .changNumLbl:return "Please, enter your new phone number"
            case .changeNumTf:return "Enter new phone number"
            case .oldPass:return "Enter old password"
            case .aboutUsT:return "About us"
            case .aboutUsText:
                return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus.Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus."
         
            case .shopAlertText1:return  "Your request has been received and we will contact you soon!"
            case .shopAlertText2:return "Sorry you don't have enough coins!Collect more coins.."
            case .reviewLbl:return "How was your experience with us?"
            case .tabBarHome:
                return "Home"
            case .tabBarCourse:
                return "My Course"
            case .tabBarBalance:
                return "Balance"
            case .tabbarProfile:
                return "Profile"
            case .logOut:
                return "LogOut"
            case .homeBuyBtn:
                return "Buy Now"
            case .searchTf:
                return "Search"
            case .homeBtn1:
                return "All"
            case .homeBtn2:
                return "Popular"
            case .homeBtn3:
                return "Newest"
            case .continueBtn:
                return "Continue"
            case .myCourseBtn1:
                return "All"
            case .myCourseBtn2:
                return "Ongoing"
            case .myCourseBtn3:
                return "Complated"
            case .tLbl:
                return "Pay and collect points,exchange your accumulated points for anything you want"
            case .tBtn:
                return "Payment"
            case .balanceBuyBtn:
                 return "Buy things"
            case .shareRefCode:
                return "Share referral code"
            case .ClaimReward:
                return "Claim reward"
            case .save:
                return "Save"
            case .send:
                return "Send"
            }
        }
    
    }
    
    enum StringType {
        case startT1
        case startT2
        case startT3
        case startD1
        case welcome
        case welcomeNTf
        case welcomeP
        case welcomeFP
        case haveAccaunt
        case createAcc
        case createNTF
        case createLNTF
        case createRC
        case alHaveAcc
        case otpLbl
        case forgotPassLbl
        case resetPassLbl
        case newPassTf
        case confirmPassTf
        case payCTitle
        case payCText
        case yelloVText
        case alertPLbl
        case bHWTitle
        case infoB1
        case infoB2
        case infoB3
        case shareTitle
        case shareText
        case coin1
        case coin2
        case coin3
        case congTitle
        case congText
        case CongCText
        case profilePay
        case profileLang
        case profileDark
        case profileAbout
        case profileShare
        case profileHelp
        case EditNButton
        case gender
        case dateB
        case changePass
        case changNumLbl
        case changeNumTf
        case oldPass
        case aboutUsT
        case aboutUsText
        case shopAlertText1
        case shopAlertText2
        case reviewLbl
        case tabBarHome
        case tabBarCourse
        case tabBarBalance
        case tabbarProfile
        case logOut
        case homeBuyBtn
        case searchTf
        case homeBtn1
        case homeBtn2
        case homeBtn3
        case continueBtn
        case myCourseBtn1
        case myCourseBtn2
        case myCourseBtn3
        case tLbl
        case tBtn
        case balanceBuyBtn
        case shareRefCode
        case ClaimReward
        case save
        case send
        
        
    }
    
    
    
    
}
