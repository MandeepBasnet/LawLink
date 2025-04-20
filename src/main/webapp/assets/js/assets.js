// This file contains references to all the assets used in the application
// Since we're in a Java web application, we'll adapt this to work with our JSP structure

// Define the context path to be used in JSP files
const contextPath = document.querySelector('meta[name="contextPath"]')?.content || '';

// Define the assets object with paths relative to the context path
const assets = {
    // Icons
    add_icon: contextPath + "/assets/images/add_icon.svg",
    appointment_icon: contextPath + "/assets/images/appointment_icon.svg",
    cancel_icon: contextPath + "/assets/images/cancel_icon.svg",
    lawyer_icon: contextPath + "/assets/images/lawyer_icon.png",
    home_icon: contextPath + "/assets/images/home_icon.svg",
    people_icon: contextPath + "/assets/images/people_icon.svg",
    upload_area: contextPath + "/assets/images/upload_area.svg",
    list_icon: contextPath + "/assets/images/list_icon.svg",
    tick_icon: contextPath + "/assets/images/tick_icon.svg",
    appointments_icon: contextPath + "/assets/images/appointments_icon.svg",
    earning_icon: contextPath + "/assets/images/earning_icon.svg",
    clients_icon: contextPath + "/assets/images/clients_icon.svg",
    chats_icon: contextPath + "/assets/images/chats_icon.svg",
    verified_icon: contextPath + "/assets/images/verified_icon.svg",
    info_icon: contextPath + "/assets/images/info_icon.svg",
    arrow_icon: contextPath + "/assets/images/arrow_icon.svg",
    menu_icon: contextPath + "/assets/images/menu_icon.svg",
    cross_icon: contextPath + "/assets/images/cross_icon.png",
    dropdown_icon: contextPath + "/assets/images/dropdown_icon.svg",
    upload_icon: contextPath + "/assets/images/upload_icon.png",

    // Images
    appointment_img: contextPath + "/assets/images/appointment-img.png",
    header_img: contextPath + "/assets/images/header.png",
    group_profiles: contextPath + "/assets/images/group_profiles.png",
    profile_pic: contextPath + "/assets/images/profile_pic.png",
    contact_image: contextPath + "/assets/images/contact_us.png",
    about_image: contextPath + "/assets/images/about_image.png",
    logo: contextPath + "/assets/images/logo.jpg",
    stripe_logo: contextPath + "/assets/images/stripe_logo.png",
    razorpay_logo: contextPath + "/assets/images/razorpay_logo.png",

    // Lawyer profile images
    law1: contextPath + "/assets/images/law-1.png",
    law2: contextPath + "/assets/images/law-2.png",
    law3: contextPath + "/assets/images/law-3.png",
    law4: contextPath + "/assets/images/law-4.png",
    law5: contextPath + "/assets/images/law-5.png",
    law6: contextPath + "/assets/images/law-6.png",
    law7: contextPath + "/assets/images/law-7.png",
    law8: contextPath + "/assets/images/law-8.png",
    law9: contextPath + "/assets/images/law-9.png",
    law10: contextPath + "/assets/images/law-10.png",
    law11: contextPath + "/assets/images/law-11.png",
    law12: contextPath + "/assets/images/law-12.png",
    law13: contextPath + "/assets/images/law-13.png",
    law14: contextPath + "/assets/images/law-14.png",
    law15: contextPath + "/assets/images/law-15.png",

    // Practice area images
    Criminal_Law: contextPath + "/assets/images/criminal-law.png",
    Family_Law: contextPath + "/assets/images/family-law.png",
    Property_Law: contextPath + "/assets/images/property-law.png",
    Labour_Law: contextPath + "/assets/images/labour-law.png",
    Contract_Law: contextPath + "/assets/images/contract-law.png",
    International_Law: contextPath + "/assets/images/international-law.png",
}

// Practice area data
const practiceData = [
    {
        practice: "Property Law",
        image: assets.Property_Law,
    },
    {
        practice: "Labour Law",
        image: assets.Labour_Law,
    },
    {
        practice: "Criminal Law",
        image: assets.Criminal_Law,
    },
    {
        practice: "International Law",
        image: assets.International_Law,
    },
    {
        practice: "Contract Law",
        image: assets.Contract_Law,
    },
    {
        practice: "Family Law",
        image: assets.Family_Law,
    },
]

// Lawyer data
const lawyers = [
    {
        _id: "law1",
        name: "Advocate Richard James",
        image: assets.law1,
        practice: "International Law",
        degree: "BA LLB and JD Degree",
        experience: "9 Years",
        about:
            "Advocate Richard James specializes in complex international law cases, offering a global perspective and strategic insights for resolving cross-border legal disputes. His passion for justice and extensive experience with international treaties, human rights, and global commerce make him a sought-after legal expert in the field.",
        fees: 50,
        address: {
            line1: "17th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law2",
        name: "Thomas Jefferson",
        image: assets.law2,
        practice: "Criminal Law",
        degree: "BA LLB and JD Degree",
        experience: "13 Years",
        about:
            "Thomas Jefferson is renowned for his relentless defense in high-profile criminal cases. With over a decade of experience in criminal law, he has built a reputation for defending the rights of the accused, delivering justice, and providing expert counsel in serious felony charges and complex legal battles.",
        fees: 60,
        address: {
            line1: "27th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law3",
        name: "Advocate Thurgood Marshall",
        image: assets.law3,
        practice: "Contract Law",
        degree: "Doctor of Juridical Science",
        experience: "10 Years",
        about:
            "Advocate Thurgood Marshall excels in contract law, helping businesses and individuals navigate through complex contractual agreements. With a decade of legal expertise, he ensures that his clients are protected against potential risks, offering meticulous attention to detail and strategic advice for contractual disputes and negotiations.",
        fees: 30,
        address: {
            line1: "37th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law4",
        name: "Johnnie Cochran",
        image: assets.law4,
        practice: "Family Law",
        degree: "BA LLB",
        experience: "12 Years",
        about:
            "Johnnie Cochran is a dedicated family law advocate with extensive experience in handling cases related to divorce, custody, and property settlements. He approaches each case with empathy, ensuring that his clients receive sound legal advice while striving for amicable solutions that protect the family's best interests.",
        fees: 40,
        address: {
            line1: "47th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law5",
        name: "Ruth Bader Ginsburg",
        image: assets.law5,
        practice: "Property Law",
        degree: "Doctor of Juridical Science",
        experience: "14 Years",
        about:
            "Ruth Bader Ginsburg brings exceptional expertise in property law, specializing in real estate transactions, disputes, and land use regulations. With a career spanning over 14 years, she offers expert legal guidance on property ownership, leasing, and complex real estate litigation.",
        fees: 50,
        address: {
            line1: "57th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law6",
        name: "Advocate Andrew Williams",
        image: assets.law6,
        practice: "Family Law",
        degree: "BA LLB and JD Degree",
        experience: "14 Years",
        about:
            "Advocate Andrew Williams is a seasoned family law attorney known for his compassionate approach to resolving family disputes. His expertise in divorce proceedings, child custody, and adoption cases ensures that his clients receive strong representation while maintaining focus on the well-being of the family.",
        fees: 50,
        address: {
            line1: "57th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law7",
        name: "Christopher Davis",
        image: assets.law7,
        practice: "Family Law",
        degree: "Doctor of Juridical Science",
        experience: "14 Years",
        about:
            "Christopher Davis is a leading family law expert with a reputation for resolving sensitive domestic matters with care and precision. With 14 years of experience, he advocates for fair resolutions in cases involving divorce, child custody, and family estate planning, always prioritizing the client's emotional and legal needs.",
        fees: 50,
        address: {
            line1: "17th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law8",
        name: "Timothy White",
        image: assets.law8,
        practice: "Criminal Law",
        degree: "Masters in Law",
        experience: "3 Years",
        about:
            "Timothy White is an emerging talent in criminal law, known for his dedication and attention to detail in defending his clients. Although relatively new to the field with 3 years of experience, he has already handled significant cases with a focus on ensuring justice for those accused of serious crimes.",
        fees: 60,
        address: {
            line1: "27th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law9",
        name: "Ava Mitchell",
        image: assets.law9,
        practice: "Labour Law",
        degree: "BA LLB and JD Degree",
        experience: "10 Years",
        about:
            "Ava Mitchell is a dedicated labour law specialist with a decade of experience handling cases related to employment disputes, workers' rights, and industrial relations. Her thorough understanding of labour laws and commitment to fair workplace practices makes her an invaluable resource for both employees and employers.",
        fees: 30,
        address: {
            line1: "37th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law10",
        name: "Advocate Clarence Darrow",
        image: assets.law10,
        practice: "Contract Law",
        degree: "Doctor of Juridical Science",
        experience: "12 Years",
        about:
            "Advocate Clarence Darrow is an experienced contract law attorney known for his proficiency in drafting and negotiating contracts. Over the course of 12 years, he has helped businesses and individuals ensure legally binding agreements that protect their interests, and he offers expert representation in contract disputes.",
        fees: 40,
        address: {
            line1: "47th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law11",
        name: "Zoe Kelly",
        image: assets.law11,
        practice: "International Law",
        degree: "BA LLB and JD Degree",
        experience: "14 Years",
        about:
            "Zoe Kelly is an expert in international law, with a focus on cross-border legal issues and international trade. With 14 years of experience, she has developed a keen understanding of the legal challenges that come with multinational transactions, treaties, and international relations, providing clients with reliable guidance.",
        fees: 50,
        address: {
            line1: "57th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law12",
        name: "Chloe Evans",
        image: assets.law12,
        practice: "Property Law",
        degree: "Doctor of Juridical Science",
        experience: "14 Years",
        about:
            "Chloe Evans is a seasoned property law expert with a 14-year track record of success in real estate litigation, property disputes, and transactions. Her attention to detail and knowledge of land use laws help clients navigate the complexities of property ownership, leasing, and development.",
        fees: 50,
        address: {
            line1: "57th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law13",
        name: "David Boies",
        image: assets.law13,
        practice: "Labour Law",
        degree: "BA LLB and JD Degree",
        experience: "14 Years",
        about:
            "David Boies is a highly respected labour law attorney with extensive experience in employee rights, union negotiations, and workplace policy. His expertise in ensuring compliance with labour laws and resolving employment disputes has earned him a reputation for fighting for justice in the workplace.",
        fees: 50,
        address: {
            line1: "17th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law14",
        name: "Ryan Martinez",
        image: assets.law14,
        practice: "Contract Law",
        degree: "Masters in Law",
        experience: "13 Years",
        about:
            "Ryan Martinez is an expert in contract law, with a specialization in drafting, reviewing, and enforcing complex agreements. His legal acumen and 13 years of experience make him a trusted advisor for businesses and individuals seeking to navigate contract negotiations and disputes with confidence.",
        fees: 60,
        address: {
            line1: "27th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
    {
        _id: "law15",
        name: "John Branca",
        image: assets.law15,
        practice: "Criminal Law",
        degree: "BA LLB and JD Degree",
        experience: "11 Years",
        about:
            "John Branca is a seasoned criminal lawyer dedicated to providing high-quality defense services. His sharp legal mind and client-centered approach have made him a trusted advocate for those in need of defense.",
        fees: 30,
        address: {
            line1: "37th Cross, Richmond",
            line2: "Circle, Ring Road, London",
        },
    },
]

// Expose the data to the window object
window.assets = assets;
window.practiceData = practiceData;
window.lawyers = lawyers;
