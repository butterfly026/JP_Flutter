// Custom platform check utilities


// Define your site IDs
const Map<String, int> siteIds = {
  'txtTest': 353,
  'txtTestDev': 353,
  'tx5804': 286,
  'a005': 471,
  'c002': 173,
  'c035': 169,
  'c048': 133,
  'c069': 402,
  'c073': 135,
  'c084': 136,
  'c084b': 529,
  'c084chat': 483,
  'c085': 372, //彩一万
  'c085ahy': 372, //金马城
  'c085c': 408, //c085c合并到c085d
  'c085d': 408, //5v5v
  'c085chat': 485,
  'c108': 138,
  'c108chat': 507,
  'c117': 352,
  'c126': 277,
  'c134': 142,
  'c137': 158,
  'c150': 179,
  'c158': 159,
  'c163': 160,
  'c163b': 383,
  'c163c': 384,
  'c169': 162,
  'c175': 148,
  'c175chat': 486,
  'c186': 322,
  'c200': 183,
  'c205': 308,
  'c208': 246,
  'c217': 255,
  'c225': 342,
  'c243': 368,
  'c243chat': 439,
  'c245': 343,
  'c246': 329,
  'c254': 357,
  'c254b': 488,
  'c259': 365,
  'c262': 388,
  'c267': 468,
  'c268': 391,
  'c269': 404,
  'c269chat': 489,
  'chat': 411,
  'c278': 434,
  'c279': 420,
  'c279b': 427,
  'c279c': 432,
  'c280a': 520,
  'c280b': 521,
  'c280c': 522,
  'c280d': 523,
  'c280e': 524,
  'c280chat': 469,
  'c281': 423,
  'c281b': 493,
  'c285': 496,
  'c288': 436,
  'c291': 441,
  'c292': 448,
  'c292chat': 451,
  'c293': 445,
  'c296': 446,
  'c297': 447,
  'c299': 463,
  'c305': 498,
  'c307': 501,
  'c308': 505,
  'c309': 504,
  'c311': 509,
  'c313chat': 512,
  'c316': 515,
  'c317': 513,
  'c318': 514,
  'c325': 535,
  'c322': 537,
  'c327': 534,
  'doy': 380,
  'h003b': 295,
  't61f': 276,
  't005': 241,
  'u002': 538,
  'v001chat': 536,
  'v005b': 500,
  'v012': 540,
  'v012b': 518,
  'v012c': 519,
  'v012d': 541,
  'v013': 477,
  'v017': 491,
  'v018': 494,
  'v020': 511,
  'c317chat': 531,
};

// Define your app domain URLs
const Map<String, List<String>> appDomainUrls = {
  't22-sk': ['http://test22.fhptdev.com'],
  't30-andrew': ['http://test30.fhptdev.com'],
  't36-augest': ['http://t036f.fhptdev.com'],
  't77-justwe': ['http://t077f.fhptdev.com'],
  't79-william': ['http://t079f.fhptdev.com'],
  't80-ezer': ['http://t080f.fhptdev.com'],
  't82-wells': ['http://t082f.fhptdev.com'],
  't83-tom': ['http://t083f.fhptdev.com'],
  't84-lingda': ['http://t084f.fhptdev.com'],
  't126_arc': ['http://t126p.fhptdev.com'],
  't128-pyro': ['http://t128f.fhptcdn.com'],
  't132f': ['http://t132f.fhptdev.com'],
  't133chat': ['http://t133f.ugjtdev.com'],
  't134-fish': ['http://t134f.fhptcdn.com'],
  't142f-beego': ['http://t142f.fhptdev.com'],
  'test04': ['http://test04.fhptdev.com/'],
  't143-oumiga': ['http://t143f.fhptdev.com'],
  'tiger2': ['http://t135f.fhptdev.com'],
  't01-harry': ['http://test01.fhptdev.com'],
  't59b_chat': ['https://t059fb.fhptdev.com'],
  't59f-ada': ['http://t059f.fhptdev.com'],
  't59b-ada': ['http://t059fb.fhptdev.com'],
  't59c-block': ['http://t059fc.fhptdev.com'],
  't59d-ada': ['https://t059fd.fhptdev.com'],
  't60ff-zora': ['https://t060ff.fhptdev.com'],
  't60ffchat': ['https://t060ff.fhptdev.com'],
  't60fa-zora': ['http://t060fa.fhptdev.com'],
  't60fb-zora': ['http://t060fb.fhptdev.com'],
  't60fc-zora': ['http://t060fc.fhptdev.com'],
  't60fd-zora': ['http://t060fd.fhptdev.com'],
  't60fe-zora': ['http://t060fe.fhptdev.com'],
  't61a-fly': ['http://t061fa.fhptdev.com'], // B站
  't61c-fly': ['http://t061fb.fhptdev.com'], // C站
  't61d-fly': ['http://t061fc.fhptdev.com'], // D站
  't61e-fly': ['http://t061fd.fhptdev.com'], // E站
  't61f-fly': ['http://t061f.fhptdev.com'], // A站
  'zhibot71f-zora': ['http://zhibot071f.fhptcdn.com'],
  'tx5804': ['http://t059f.fhptdev.com'],
  'test28f': ['http://test28f.fhptdev.com'],
};

// Define your test domain URLs
const Map<String, List<String>> testDomainUrls = {
  't005': ['http://t005f.fhptdev.com'],
  't005chat': ['http://t005f.fhptdev.com'],
  't085f': ['http://t085f.fhptdev.com'],
  't085fchat': ['http://t085f.fhptdev.com'],
  't06': ['http://test06.fhptdev.com'],
  't07': ['http://test07.6yc.com'],
  't08': ['http://test08.6yc.com'],
  't09': ['http://test09.6yc.com'],
  't10': ['https://test10.6yc.com'],
  't11.6yc': ['http://test11.6yc.com'],
  't11.fhptdev': ['http://test11.fhptdev.com'],
  't12': ['http://test12.fhptdev.com'],
  't19': ['http://test19.6yc.com'],
  't20': ['http://test20.6yc.com/'],
  't21': ['https://test21.fhptdev.com/'],
  't28': ['http://test28f.fhptdev.com/'],
  't29b': ['http://t029f1.fhptdev.com/'],
  't29c': ['http://t029f2.fhptdev.com/'],
  't29f': ['http://test29f.fhptdev.com'],
  't030': ['http://test30.fhptdev.com'],
  't58': ['http://test58f.fhptdev.com'],
  't500': ['http://t500f.fhptcdn.com'],
  't501': ['http://t501f.fhptcdn.com'],
  't502': ['http://t502f.fhptcdn.com'],
  't5804': ['http://test5804.ccpt.site'],
  't62': ['http://test62f.ccpt.site'],
  't127': ['http://t127f.fhptcdn.com'],
  'doy': ['https://wallet-api.doypay.com'],
  // 'doy_test': DeviceUtil.isIOS ? ['xxx'] : ['http://wallet-apitest.doypay.com'],
  'tx5804': ['http://t059f.fhptdev.com'],
  'nn001': ['https://gentingin6.com/'],
};

// Combine app and test domain URLs
final Map<String, List<String>> multiDomainUrls = {
  ...appDomainUrls,
  ...testDomainUrls,
};

// Filtered domain URLs
Map<String, String> domainUrls = {};

// Recombine domain function
void recombineDomain(Map<String, String> siteUrl) {
  final Map<String, String> filterDomain = {};
  multiDomainUrls.forEach((key, value) {
    filterDomain[key] = value[0];
  });

  domainUrls = {
    ...filterDomain,
    ...siteUrl,
  };
}

// Notify domain changed function
Future<void> notifyDomainChanged({String? siteId}) async {
  final Map<String, String> sites = {};
  domainUrls.forEach((key, value) {
    sites[key.toLowerCase()] = value;
  });
}

// Initialize domain function
Future<void> initDomain({String? siteId}) async {
  // Load previously saved current domain
  // final lastDomains = await UGStore.loadValueForKey(AsyncStorageKey.domainUrls);
  // if (!dicNull(lastDomains)) {
  //   multiDomainUrls.addAll(lastDomains);
  // }
  // Recombine domain with default values
  // recombineDomain({});
  // UGStore.saveValueWithKey(AsyncStorageKey.rechargePopOnce, '1');
  // await notifyDomainChanged(siteId: siteId);
}

void main() {
  // Example usage
  initDomain(siteId: 'c002');
}

