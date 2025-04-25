import SwiftUI

struct Icons
{
    let tabs = Tabs()
    let system = System()
    let social = SocialLink()
    let systemName = SystemName()
    let base = Base()
    let empty = Empty()
    let walkthrough = Walkthrough()
    let placeholder = Placeholder()

    struct Tabs
    {
        let account = Image(systemName: "person")
        let accountSelected = Image(systemName: "person.fill")
        let home = Image(systemName: "house")
        let homeSelected = Image(systemName: "house.fill")
        let order = Image(systemName: "cart")
        let orderSelected = Image(systemName: "cart.fill")
        let rewards = Image(systemName: "star")
        let rewardsSelected = Image(systemName: "star.fill")
        let scan = Image(systemName: "qrcode.viewfinder")
    }

    struct System
    {
        let bag = Image(systemName: "bag")
        let bagBadgePlus = Image(systemName: "bag.badge.plus")
        let basketFill = Image(systemName: "basket.fill")
        let cartFill = Image(systemName: "cart.fill")
        let checkmark = Image(systemName: "checkmark")
        let checkmarkCircle = Image(systemName: "checkmark.circle")
        let checkmarkCircleFill = Image(systemName: "checkmark.circle.fill")
        let checkmarkSquareFill = Image(systemName: "checkmark.square.fill")
        let chevronDown = Image(systemName: "chevron.down")
        let chevronRight = Image(systemName: "chevron.right")
        let chevronRightCircle = Image(systemName: "chevron.right.circle")
        let chevronUp = Image(systemName: "chevron.up")
        let chevronBackward = Image(systemName: "chevron.backward")
        let clock = Image(systemName: "clock")
        let creditcardFill = Image(systemName: "creditcard.fill")
        let plusRectangle = Image(systemName: "plus.rectangle")
        let creditcardAnd123 = Image(systemName: "creditcard.and.123")
        let eyeFill = Image(systemName: "eye.fill")
        let eyeSlashFill = Image(systemName: "eye.slash.fill")
        let locationFill = Image(systemName: "location.fill")
        let minus = Image(systemName: "minus")
        let minusCircle = Image(systemName: "minus.circle")
        let plus = Image(systemName: "plus")
        let square = Image(systemName: "square")
        let xmark = Image(systemName: "xmark")
        let xmarkCircleFill = Image(systemName: "xmark.circle.fill")
        let xmarkCircle = Image(systemName: "xmark.circle")
        let clear = Image(systemName: "multiply.circle.fill")
        let tag = Image(systemName: "tag")
        let forkKnife = Image(systemName: "fork.knife")
        let trash = Image(systemName: "trash")
        let person = Image(systemName: "person")
        let personFilled = Image(systemName: "person.fill")
        let dollarSign = Image(systemName: "dollarsign")
        let clockFill = Image(systemName: "clock.fill")
        let exclamationTriangleFill = Image(systemName: "exclamationmark.triangle.fill")
        let exclamationCircleFill = Image(systemName: "exclamationmark.circle.fill")
        let exclamationCircle = Image(systemName: "exclamationmark.circle")
        let plusCircle = Image(systemName: "plus.circle")
        let plusCircleFill = Image(systemName: "plus.circle.fill")
        let trashCircle = Image(systemName: "trash.circle")
        let checkMarkCirlce = Image(systemName: "checkmark.circle")
        let appleLogo = Image(systemName: "apple.logo")
        let giftcardFill = Image(systemName: "giftcard.fill")
        let car = Image(systemName: "car")
        let mappinAndEllipse = Image(systemName: "mappin.and.ellipse")
        let slider = Image(systemName: "slider.horizontal.3")
        let sparkles = Image(systemName: "sparkles")
        let arrowUpForward = Image(systemName: "arrow.up.forward.app")
    }
    
    struct SocialLink
    {
        let instagram = Image("Instagram")
        let twitter = Image("Twitter")
        let facebook = Image("Facebook")
        let tiktok = Image("TikTok")
        let pinterest = Image("pinterest")
        let snapchat = Image("snapchat")
        let youtube = Image("youtube-play-button-fill")
        let linkedin = Image("linkedin")
        let yelp = Image("Yelp")
        let link = Image(systemName: "link")
        let oktaIcon = Image("okta_symbol")
    }

    struct SystemName
    {
        let heartFill = "heart.fill"
        let heart = "heart"
        let forkKnife = "fork.knife"
    }

    struct Base
    {
        let brand = Image("Brand")
        let logo = Image("Logo")
        let close = Image("CloseButton")
        let locationPin = Image("LocationPin", bundle: .main).renderingMode(.template)
        let locationPinFilled = Image(systemName: "mappin")
        let phoneIcon = Image("PhoneIcon", bundle: .main).renderingMode(.template)
        let mapPin = Image("MapPin")
        let menuCategoryList = Image("MenuCategoryList", bundle: .main).renderingMode(.template)
        let reward = Image("RewardIcon", bundle: .main).renderingMode(.template)
        let rewardFill = Image("RewardFillIcon", bundle: .main).renderingMode(.template)
        let googleIcon = Image("GoogleIcon")
        let userLocationPin = Image(systemName: "location.fill")
        let person2Fill = Image(systemName: "person.2.fill")
    }

    struct Empty
    {
        let error = Image("EmptyError")
        let location = Image("EmptyLocation")
        let order = Image("EmptyOrder")
    }

    struct Walkthrough
    {
        let notifications = Image("WalkthroughNotifications")
    }

    struct Placeholder
    {
        let manageCards = Image("EmptyPayments")
    }
}
