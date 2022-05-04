// To parse this JSON data, do
//
//     final exoticItem = exoticItemFromJson(jsonString);


import 'dart:convert';

import 'package:find_xur/models/global.dart' as global;

class ExoticItem {
    ExoticItem({
        this.displayProperties,
        this.tooltipNotifications,
        this.collectibleHash,
        this.backgroundColor,
        this.screenshot,
        this.itemTypeDisplayName,
        this.uiItemDisplayStyle,
        this.itemTypeAndTierDisplayName,
        this.displaySource,
        this.action,
        this.inventory,
        this.stats,
        this.equippingBlock,
        this.translationBlock,
        this.preview,
        this.quality,
        this.objectives,
        this.acquireRewardSiteHash,
        this.acquireUnlockHash,
        this.sockets,
        this.talentGrid,
        this.investmentStats,
        this.perks,
        this.loreHash,
        this.summaryItemHash,
        this.allowActions,
        this.doesPostmasterPullHaveSideEffects,
        this.nonTransferrable,
        this.itemCategoryHashes,
        this.specialItemType,
        this.itemType,
        this.itemSubType,
        this.classType,
        this.breakerType,
        this.equippable,
        this.damageTypeHashes,
        this.damageTypes,
        this.defaultDamageType,
        this.defaultDamageTypeHash,
        this.isWrapper,
        this.traitIds,
        this.hash,
        this.index,
        this.redacted,
        this.blacklisted,
    });

    DisplayProperties displayProperties;
    List<dynamic> tooltipNotifications;
    int collectibleHash;
    BackgroundColor backgroundColor;
    String screenshot;
    String itemTypeDisplayName;
    String uiItemDisplayStyle;
    String itemTypeAndTierDisplayName;
    String displaySource;
    Action action;
    Inventory inventory;
    Stats stats;
    EquippingBlock equippingBlock;
    TranslationBlock translationBlock;
    Preview preview;
    Quality quality;
    Objectives objectives;
    int acquireRewardSiteHash;
    int acquireUnlockHash;
    Sockets sockets;
    TalentGrid talentGrid;
    List<InvestmentStat> investmentStats;
    List<dynamic> perks;
    int loreHash;
    int summaryItemHash;
    bool allowActions;
    bool doesPostmasterPullHaveSideEffects;
    bool nonTransferrable;
    List<int> itemCategoryHashes;
    int specialItemType;
    int itemType;
    int itemSubType;
    int classType;
    int breakerType;
    bool equippable;
    List<int> damageTypeHashes;
    List<int> damageTypes;
    int defaultDamageType;
    int defaultDamageTypeHash;
    bool isWrapper;
    List<String> traitIds;
    int hash;
    int index;
    bool redacted;
    bool blacklisted;

    factory ExoticItem.fromRawJson(String str) => ExoticItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ExoticItem.fromJson(Map<String, dynamic> json) => ExoticItem(
        displayProperties: json["displayProperties"] == null ? null : DisplayProperties.fromJson(json["displayProperties"]),
        tooltipNotifications: json["tooltipNotifications"] == null ? null : List<dynamic>.from(json["tooltipNotifications"].map((x) => x)),
        collectibleHash: json["collectibleHash"] == null ? null : json["collectibleHash"],
        backgroundColor: json["backgroundColor"] == null ? null : BackgroundColor.fromJson(json["backgroundColor"]),
        screenshot: json["screenshot"] == null ? null : "https://www.bungie.net" + json["screenshot"],
        itemTypeDisplayName: json["itemTypeDisplayName"] == null ? null : json["itemTypeDisplayName"],
        uiItemDisplayStyle: json["uiItemDisplayStyle"] == null ? null : json["uiItemDisplayStyle"],
        itemTypeAndTierDisplayName: json["itemTypeAndTierDisplayName"] == null ? null : json["itemTypeAndTierDisplayName"],
        displaySource: json["displaySource"] == null ? null : json["displaySource"],
        action: json["action"] == null ? null : Action.fromJson(json["action"]),
        inventory: json["inventory"] == null ? null : Inventory.fromJson(json["inventory"]),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        equippingBlock: json["equippingBlock"] == null ? null : EquippingBlock.fromJson(json["equippingBlock"]),
        translationBlock: json["translationBlock"] == null ? null : TranslationBlock.fromJson(json["translationBlock"]),
        preview: json["preview"] == null ? null : Preview.fromJson(json["preview"]),
        quality: json["quality"] == null ? null : Quality.fromJson(json["quality"]),
        objectives: json["objectives"] == null ? null : Objectives.fromJson(json["objectives"]),
        acquireRewardSiteHash: json["acquireRewardSiteHash"] == null ? null : json["acquireRewardSiteHash"],
        acquireUnlockHash: json["acquireUnlockHash"] == null ? null : json["acquireUnlockHash"],
        sockets: json["sockets"] == null ? null : Sockets.fromJson(json["sockets"]),
        talentGrid: json["talentGrid"] == null ? null : TalentGrid.fromJson(json["talentGrid"]),
        investmentStats: json["investmentStats"] == null ? null : List<InvestmentStat>.from(json["investmentStats"].map((x) => InvestmentStat.fromJson(x))),
        perks: json["perks"] == null ? null : List<dynamic>.from(json["perks"].map((x) => x)),
        loreHash: json["loreHash"] == null ? null : json["loreHash"],
        summaryItemHash: json["summaryItemHash"] == null ? null : json["summaryItemHash"],
        allowActions: json["allowActions"] == null ? null : json["allowActions"],
        doesPostmasterPullHaveSideEffects: json["doesPostmasterPullHaveSideEffects"] == null ? null : json["doesPostmasterPullHaveSideEffects"],
        nonTransferrable: json["nonTransferrable"] == null ? null : json["nonTransferrable"],
        itemCategoryHashes: json["itemCategoryHashes"] == null ? null : List<int>.from(json["itemCategoryHashes"].map((x) => x)),
        specialItemType: json["specialItemType"] == null ? null : json["specialItemType"],
        itemType: json["itemType"] == null ? null : json["itemType"],
        itemSubType: json["itemSubType"] == null ? null : json["itemSubType"],
        classType: json["classType"] == null ? null : json["classType"],
        breakerType: json["breakerType"] == null ? null : json["breakerType"],
        equippable: json["equippable"] == null ? null : json["equippable"],
        damageTypeHashes: json["damageTypeHashes"] == null ? null : List<int>.from(json["damageTypeHashes"].map((x) => x)),
        damageTypes: json["damageTypes"] == null ? null : List<int>.from(json["damageTypes"].map((x) => x)),
        defaultDamageType: json["defaultDamageType"] == null ? null : json["defaultDamageType"],
        defaultDamageTypeHash: json["defaultDamageTypeHash"] == null ? null : json["defaultDamageTypeHash"],
        isWrapper: json["isWrapper"] == null ? null : json["isWrapper"],
        traitIds: json["traitIds"] == null ? null : List<String>.from(json["traitIds"].map((x) => x)),
        hash: json["hash"] == null ? null : json["hash"],
        index: json["index"] == null ? null : json["index"],
        redacted: json["redacted"] == null ? null : json["redacted"],
        blacklisted: json["blacklisted"] == null ? null : json["blacklisted"],
    );

    Map<String, dynamic> toJson() => {
        "displayProperties": displayProperties == null ? null : displayProperties.toJson(),
        "tooltipNotifications": tooltipNotifications == null ? null : List<dynamic>.from(tooltipNotifications.map((x) => x)),
        "collectibleHash": collectibleHash == null ? null : collectibleHash,
        "backgroundColor": backgroundColor == null ? null : backgroundColor.toJson(),
        "screenshot": screenshot == null ? null : screenshot,
        "itemTypeDisplayName": itemTypeDisplayName == null ? null : itemTypeDisplayName,
        "uiItemDisplayStyle": uiItemDisplayStyle == null ? null : uiItemDisplayStyle,
        "itemTypeAndTierDisplayName": itemTypeAndTierDisplayName == null ? null : itemTypeAndTierDisplayName,
        "displaySource": displaySource == null ? null : displaySource,
        "action": action == null ? null : action.toJson(),
        "inventory": inventory == null ? null : inventory.toJson(),
        "stats": stats == null ? null : stats.toJson(),
        "equippingBlock": equippingBlock == null ? null : equippingBlock.toJson(),
        "translationBlock": translationBlock == null ? null : translationBlock.toJson(),
        "preview": preview == null ? null : preview.toJson(),
        "quality": quality == null ? null : quality.toJson(),
        "objectives": objectives == null ? null : objectives.toJson(),
        "acquireRewardSiteHash": acquireRewardSiteHash == null ? null : acquireRewardSiteHash,
        "acquireUnlockHash": acquireUnlockHash == null ? null : acquireUnlockHash,
        "sockets": sockets == null ? null : sockets.toJson(),
        "talentGrid": talentGrid == null ? null : talentGrid.toJson(),
        "investmentStats": investmentStats == null ? null : List<dynamic>.from(investmentStats.map((x) => x.toJson())),
        "perks": perks == null ? null : List<dynamic>.from(perks.map((x) => x)),
        "loreHash": loreHash == null ? null : loreHash,
        "summaryItemHash": summaryItemHash == null ? null : summaryItemHash,
        "allowActions": allowActions == null ? null : allowActions,
        "doesPostmasterPullHaveSideEffects": doesPostmasterPullHaveSideEffects == null ? null : doesPostmasterPullHaveSideEffects,
        "nonTransferrable": nonTransferrable == null ? null : nonTransferrable,
        "itemCategoryHashes": itemCategoryHashes == null ? null : List<dynamic>.from(itemCategoryHashes.map((x) => x)),
        "specialItemType": specialItemType == null ? null : specialItemType,
        "itemType": itemType == null ? null : itemType,
        "itemSubType": itemSubType == null ? null : itemSubType,
        "classType": classType == null ? null : classType,
        "breakerType": breakerType == null ? null : breakerType,
        "equippable": equippable == null ? null : equippable,
        "damageTypeHashes": damageTypeHashes == null ? null : List<dynamic>.from(damageTypeHashes.map((x) => x)),
        "damageTypes": damageTypes == null ? null : List<dynamic>.from(damageTypes.map((x) => x)),
        "defaultDamageType": defaultDamageType == null ? null : defaultDamageType,
        "defaultDamageTypeHash": defaultDamageTypeHash == null ? null : defaultDamageTypeHash,
        "isWrapper": isWrapper == null ? null : isWrapper,
        "traitIds": traitIds == null ? null : List<dynamic>.from(traitIds.map((x) => x)),
        "hash": hash == null ? null : hash,
        "index": index == null ? null : index,
        "redacted": redacted == null ? null : redacted,
        "blacklisted": blacklisted == null ? null : blacklisted,
    };

    // Get Stat -> returns a stat with the same hash as arg if it exists.
    Stat getStat(int hash) {
      Stat temp;
      this.stats.stats.forEach((key,stat) {
        if (stat.statHash == hash) {
          temp = stat;
        }
      });
      return temp;
    }

    List<Stat> getStats(int itemSubType) {
      List<Stat> _tempStats = new List();

      switch (itemSubType) {
            case 31: // BOW
              global.bowWeaponStats.forEach((hash) {
                _tempStats.add(this.getStat(hash));
              });
              break;
            case 18: // SWORD
              global.swordWeaponStats.forEach((hash) {
                _tempStats.add(this.getStat(hash));
              });
              break;
            case 11: // FUSION RIFLE
              global.fusionWeaponStats.forEach((hash) {
                _tempStats.add(this.getStat(hash));
              });
              break;
            case 22: // LINEAR FUSION RIFLE
              global.fusionWeaponStats.forEach((hash) {
                _tempStats.add(this.getStat(hash));
              });
              break;
            case 10: // ROCKET LAUNCHER
              global.launcherWeaponStats.forEach((hash) {
                _tempStats.add(this.getStat(hash));
              });
              break;
            case 23: // GRENADE LAUNCHER
              global.launcherWeaponStats.forEach((hash) {
                _tempStats.add(this.getStat(hash));
              });
              break;
            default: // DEFAULT
              global.defaultWeaponStats.forEach((hash) {
                _tempStats.add(this.getStat(hash));
              });
              break;
          }
      return _tempStats;
    }

    List<Stat> getGearStats(){
      List<Stat> _tempStats = new List();

      this.stats.stats.forEach((key, stat) {
        bool _isBlackListed = false;

        global.statBlacklist.forEach((bannedHash) {
          if (stat.statHash == bannedHash) {
            _isBlackListed = true;
          }
        });
        if(!_isBlackListed){
          _tempStats.add(stat);
        }
      });
      return _tempStats;
    }

    int statCount(int itemSubType){
      var _tempStats = this.getStats(itemSubType);
      return _tempStats.length;
    }

    int gearStatCount(){
      var _tempStats = this.getGearStats();
      return _tempStats.length;
    }

    // Get HiddenStats -> returns a list with hidden stats if any exists.
    List<Stat> getHiddenStats() {
      List<Stat> _hiddenStats = new List();
      this.stats.stats.forEach((key,stat) {
        global.hiddenWeaponStats.forEach((hash) { 
          if (stat.statHash == hash) {
            _hiddenStats.add(stat);
          }
        });
      });
      return _hiddenStats;
  }

}

class Action {
    Action({
        this.verbName,
        this.verbDescription,
        this.isPositive,
        this.requiredCooldownSeconds,
        this.requiredItems,
        this.progressionRewards,
        this.actionTypeLabel,
        this.rewardSheetHash,
        this.rewardItemHash,
        this.rewardSiteHash,
        this.requiredCooldownHash,
        this.deleteOnAction,
        this.consumeEntireStack,
        this.useOnAcquire,
    });

    String verbName;
    String verbDescription;
    bool isPositive;
    int requiredCooldownSeconds;
    List<dynamic> requiredItems;
    List<dynamic> progressionRewards;
    String actionTypeLabel;
    int rewardSheetHash;
    int rewardItemHash;
    int rewardSiteHash;
    int requiredCooldownHash;
    bool deleteOnAction;
    bool consumeEntireStack;
    bool useOnAcquire;

    factory Action.fromRawJson(String str) => Action.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Action.fromJson(Map<String, dynamic> json) => Action(
        verbName: json["verbName"] == null ? null : json["verbName"],
        verbDescription: json["verbDescription"] == null ? null : json["verbDescription"],
        isPositive: json["isPositive"] == null ? null : json["isPositive"],
        requiredCooldownSeconds: json["requiredCooldownSeconds"] == null ? null : json["requiredCooldownSeconds"],
        requiredItems: json["requiredItems"] == null ? null : List<dynamic>.from(json["requiredItems"].map((x) => x)),
        progressionRewards: json["progressionRewards"] == null ? null : List<dynamic>.from(json["progressionRewards"].map((x) => x)),
        actionTypeLabel: json["actionTypeLabel"] == null ? null : json["actionTypeLabel"],
        rewardSheetHash: json["rewardSheetHash"] == null ? null : json["rewardSheetHash"],
        rewardItemHash: json["rewardItemHash"] == null ? null : json["rewardItemHash"],
        rewardSiteHash: json["rewardSiteHash"] == null ? null : json["rewardSiteHash"],
        requiredCooldownHash: json["requiredCooldownHash"] == null ? null : json["requiredCooldownHash"],
        deleteOnAction: json["deleteOnAction"] == null ? null : json["deleteOnAction"],
        consumeEntireStack: json["consumeEntireStack"] == null ? null : json["consumeEntireStack"],
        useOnAcquire: json["useOnAcquire"] == null ? null : json["useOnAcquire"],
    );

    Map<String, dynamic> toJson() => {
        "verbName": verbName == null ? null : verbName,
        "verbDescription": verbDescription == null ? null : verbDescription,
        "isPositive": isPositive == null ? null : isPositive,
        "requiredCooldownSeconds": requiredCooldownSeconds == null ? null : requiredCooldownSeconds,
        "requiredItems": requiredItems == null ? null : List<dynamic>.from(requiredItems.map((x) => x)),
        "progressionRewards": progressionRewards == null ? null : List<dynamic>.from(progressionRewards.map((x) => x)),
        "actionTypeLabel": actionTypeLabel == null ? null : actionTypeLabel,
        "rewardSheetHash": rewardSheetHash == null ? null : rewardSheetHash,
        "rewardItemHash": rewardItemHash == null ? null : rewardItemHash,
        "rewardSiteHash": rewardSiteHash == null ? null : rewardSiteHash,
        "requiredCooldownHash": requiredCooldownHash == null ? null : requiredCooldownHash,
        "deleteOnAction": deleteOnAction == null ? null : deleteOnAction,
        "consumeEntireStack": consumeEntireStack == null ? null : consumeEntireStack,
        "useOnAcquire": useOnAcquire == null ? null : useOnAcquire,
    };

}

class BackgroundColor {
    BackgroundColor({
        this.red,
        this.green,
        this.blue,
        this.alpha,
    });

    int red;
    int green;
    int blue;
    int alpha;

    factory BackgroundColor.fromRawJson(String str) => BackgroundColor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BackgroundColor.fromJson(Map<String, dynamic> json) => BackgroundColor(
        red: json["red"] == null ? null : json["red"],
        green: json["green"] == null ? null : json["green"],
        blue: json["blue"] == null ? null : json["blue"],
        alpha: json["alpha"] == null ? null : json["alpha"],
    );

    Map<String, dynamic> toJson() => {
        "red": red == null ? null : red,
        "green": green == null ? null : green,
        "blue": blue == null ? null : blue,
        "alpha": alpha == null ? null : alpha,
    };
}

class DisplayProperties {
    DisplayProperties({
        this.description,
        this.name,
        this.icon,
        this.hasIcon,
    });

    String description;
    String name;
    String icon;
    bool hasIcon;

    factory DisplayProperties.fromRawJson(String str) => DisplayProperties.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DisplayProperties.fromJson(Map<String, dynamic> json) => DisplayProperties(
        description: json["description"] == null ? null : json["description"],
        name: json["name"] == null ? null : json["name"],
        icon: json["icon"] == null ? null : json["icon"].substring(30, 67),
        hasIcon: json["hasIcon"] == null ? null : json["hasIcon"],
    );

    Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "name": name == null ? null : name,
        "icon": icon == null ? null : icon,
        "hasIcon": hasIcon == null ? null : hasIcon,
    };
}

class EquippingBlock {
    EquippingBlock({
        this.uniqueLabel,
        this.uniqueLabelHash,
        this.equipmentSlotTypeHash,
        this.attributes,
        this.equippingSoundHash,
        this.hornSoundHash,
        this.ammoType,
        this.displayStrings,
    });

    String uniqueLabel;
    int uniqueLabelHash;
    int equipmentSlotTypeHash;
    int attributes;
    int equippingSoundHash;
    int hornSoundHash;
    int ammoType;
    List<String> displayStrings;

    factory EquippingBlock.fromRawJson(String str) => EquippingBlock.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EquippingBlock.fromJson(Map<String, dynamic> json) => EquippingBlock(
        uniqueLabel: json["uniqueLabel"] == null ? null : json["uniqueLabel"],
        uniqueLabelHash: json["uniqueLabelHash"] == null ? null : json["uniqueLabelHash"],
        equipmentSlotTypeHash: json["equipmentSlotTypeHash"] == null ? null : json["equipmentSlotTypeHash"],
        attributes: json["attributes"] == null ? null : json["attributes"],
        equippingSoundHash: json["equippingSoundHash"] == null ? null : json["equippingSoundHash"],
        hornSoundHash: json["hornSoundHash"] == null ? null : json["hornSoundHash"],
        ammoType: json["ammoType"] == null ? null : json["ammoType"],
        displayStrings: json["displayStrings"] == null ? null : List<String>.from(json["displayStrings"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "uniqueLabel": uniqueLabel == null ? null : uniqueLabel,
        "uniqueLabelHash": uniqueLabelHash == null ? null : uniqueLabelHash,
        "equipmentSlotTypeHash": equipmentSlotTypeHash == null ? null : equipmentSlotTypeHash,
        "attributes": attributes == null ? null : attributes,
        "equippingSoundHash": equippingSoundHash == null ? null : equippingSoundHash,
        "hornSoundHash": hornSoundHash == null ? null : hornSoundHash,
        "ammoType": ammoType == null ? null : ammoType,
        "displayStrings": displayStrings == null ? null : List<dynamic>.from(displayStrings.map((x) => x)),
    };
}

class Inventory {
    Inventory({
        this.maxStackSize,
        this.bucketTypeHash,
        this.recoveryBucketTypeHash,
        this.tierTypeHash,
        this.isInstanceItem,
        this.nonTransferrableOriginal,
        this.tierTypeName,
        this.tierType,
        this.expirationTooltip,
        this.expiredInActivityMessage,
        this.expiredInOrbitMessage,
        this.suppressExpirationWhenObjectivesComplete,
    });

    int maxStackSize;
    int bucketTypeHash;
    int recoveryBucketTypeHash;
    int tierTypeHash;
    bool isInstanceItem;
    bool nonTransferrableOriginal;
    String tierTypeName;
    int tierType;
    String expirationTooltip;
    String expiredInActivityMessage;
    String expiredInOrbitMessage;
    bool suppressExpirationWhenObjectivesComplete;

    factory Inventory.fromRawJson(String str) => Inventory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        maxStackSize: json["maxStackSize"] == null ? null : json["maxStackSize"],
        bucketTypeHash: json["bucketTypeHash"] == null ? null : json["bucketTypeHash"],
        recoveryBucketTypeHash: json["recoveryBucketTypeHash"] == null ? null : json["recoveryBucketTypeHash"],
        tierTypeHash: json["tierTypeHash"] == null ? null : json["tierTypeHash"],
        isInstanceItem: json["isInstanceItem"] == null ? null : json["isInstanceItem"],
        nonTransferrableOriginal: json["nonTransferrableOriginal"] == null ? null : json["nonTransferrableOriginal"],
        tierTypeName: json["tierTypeName"] == null ? null : json["tierTypeName"],
        tierType: json["tierType"] == null ? null : json["tierType"],
        expirationTooltip: json["expirationTooltip"] == null ? null : json["expirationTooltip"],
        expiredInActivityMessage: json["expiredInActivityMessage"] == null ? null : json["expiredInActivityMessage"],
        expiredInOrbitMessage: json["expiredInOrbitMessage"] == null ? null : json["expiredInOrbitMessage"],
        suppressExpirationWhenObjectivesComplete: json["suppressExpirationWhenObjectivesComplete"] == null ? null : json["suppressExpirationWhenObjectivesComplete"],
    );

    Map<String, dynamic> toJson() => {
        "maxStackSize": maxStackSize == null ? null : maxStackSize,
        "bucketTypeHash": bucketTypeHash == null ? null : bucketTypeHash,
        "recoveryBucketTypeHash": recoveryBucketTypeHash == null ? null : recoveryBucketTypeHash,
        "tierTypeHash": tierTypeHash == null ? null : tierTypeHash,
        "isInstanceItem": isInstanceItem == null ? null : isInstanceItem,
        "nonTransferrableOriginal": nonTransferrableOriginal == null ? null : nonTransferrableOriginal,
        "tierTypeName": tierTypeName == null ? null : tierTypeName,
        "tierType": tierType == null ? null : tierType,
        "expirationTooltip": expirationTooltip == null ? null : expirationTooltip,
        "expiredInActivityMessage": expiredInActivityMessage == null ? null : expiredInActivityMessage,
        "expiredInOrbitMessage": expiredInOrbitMessage == null ? null : expiredInOrbitMessage,
        "suppressExpirationWhenObjectivesComplete": suppressExpirationWhenObjectivesComplete == null ? null : suppressExpirationWhenObjectivesComplete,
    };
}

class InvestmentStat {
    InvestmentStat({
        this.statTypeHash,
        this.value,
        this.isConditionallyActive,
    });

    int statTypeHash;
    int value;
    bool isConditionallyActive;

    factory InvestmentStat.fromRawJson(String str) => InvestmentStat.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory InvestmentStat.fromJson(Map<String, dynamic> json) => InvestmentStat(
        statTypeHash: json["statTypeHash"] == null ? null : json["statTypeHash"],
        value: json["value"] == null ? null : json["value"],
        isConditionallyActive: json["isConditionallyActive"] == null ? null : json["isConditionallyActive"],
    );

    Map<String, dynamic> toJson() => {
        "statTypeHash": statTypeHash == null ? null : statTypeHash,
        "value": value == null ? null : value,
        "isConditionallyActive": isConditionallyActive == null ? null : isConditionallyActive,
    };
}

class Objectives {
    Objectives({
        this.objectiveHashes,
        this.displayActivityHashes,
        this.requireFullObjectiveCompletion,
        this.questlineItemHash,
        this.narrative,
        this.objectiveVerbName,
        this.questTypeIdentifier,
        this.questTypeHash,
        this.completionRewardSiteHash,
        this.nextQuestStepRewardSiteHash,
        this.timestampUnlockValueHash,
        this.isGlobalObjectiveItem,
        this.useOnObjectiveCompletion,
        this.inhibitCompletionUnlockValueHash,
        this.perObjectiveDisplayProperties,
        this.displayAsStatTracker,
    });

    List<int> objectiveHashes;
    List<int> displayActivityHashes;
    bool requireFullObjectiveCompletion;
    int questlineItemHash;
    String narrative;
    String objectiveVerbName;
    String questTypeIdentifier;
    int questTypeHash;
    int completionRewardSiteHash;
    int nextQuestStepRewardSiteHash;
    int timestampUnlockValueHash;
    bool isGlobalObjectiveItem;
    bool useOnObjectiveCompletion;
    int inhibitCompletionUnlockValueHash;
    List<PerObjectiveDisplayProperty> perObjectiveDisplayProperties;
    bool displayAsStatTracker;

    factory Objectives.fromRawJson(String str) => Objectives.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Objectives.fromJson(Map<String, dynamic> json) => Objectives(
        objectiveHashes: json["objectiveHashes"] == null ? null : List<int>.from(json["objectiveHashes"].map((x) => x)),
        displayActivityHashes: json["displayActivityHashes"] == null ? null : List<int>.from(json["displayActivityHashes"].map((x) => x)),
        requireFullObjectiveCompletion: json["requireFullObjectiveCompletion"] == null ? null : json["requireFullObjectiveCompletion"],
        questlineItemHash: json["questlineItemHash"] == null ? null : json["questlineItemHash"],
        narrative: json["narrative"] == null ? null : json["narrative"],
        objectiveVerbName: json["objectiveVerbName"] == null ? null : json["objectiveVerbName"],
        questTypeIdentifier: json["questTypeIdentifier"] == null ? null : json["questTypeIdentifier"],
        questTypeHash: json["questTypeHash"] == null ? null : json["questTypeHash"],
        completionRewardSiteHash: json["completionRewardSiteHash"] == null ? null : json["completionRewardSiteHash"],
        nextQuestStepRewardSiteHash: json["nextQuestStepRewardSiteHash"] == null ? null : json["nextQuestStepRewardSiteHash"],
        timestampUnlockValueHash: json["timestampUnlockValueHash"] == null ? null : json["timestampUnlockValueHash"],
        isGlobalObjectiveItem: json["isGlobalObjectiveItem"] == null ? null : json["isGlobalObjectiveItem"],
        useOnObjectiveCompletion: json["useOnObjectiveCompletion"] == null ? null : json["useOnObjectiveCompletion"],
        inhibitCompletionUnlockValueHash: json["inhibitCompletionUnlockValueHash"] == null ? null : json["inhibitCompletionUnlockValueHash"],
        perObjectiveDisplayProperties: json["perObjectiveDisplayProperties"] == null ? null : List<PerObjectiveDisplayProperty>.from(json["perObjectiveDisplayProperties"].map((x) => PerObjectiveDisplayProperty.fromJson(x))),
        displayAsStatTracker: json["displayAsStatTracker"] == null ? null : json["displayAsStatTracker"],
    );

    Map<String, dynamic> toJson() => {
        "objectiveHashes": objectiveHashes == null ? null : List<dynamic>.from(objectiveHashes.map((x) => x)),
        "displayActivityHashes": displayActivityHashes == null ? null : List<dynamic>.from(displayActivityHashes.map((x) => x)),
        "requireFullObjectiveCompletion": requireFullObjectiveCompletion == null ? null : requireFullObjectiveCompletion,
        "questlineItemHash": questlineItemHash == null ? null : questlineItemHash,
        "narrative": narrative == null ? null : narrative,
        "objectiveVerbName": objectiveVerbName == null ? null : objectiveVerbName,
        "questTypeIdentifier": questTypeIdentifier == null ? null : questTypeIdentifier,
        "questTypeHash": questTypeHash == null ? null : questTypeHash,
        "completionRewardSiteHash": completionRewardSiteHash == null ? null : completionRewardSiteHash,
        "nextQuestStepRewardSiteHash": nextQuestStepRewardSiteHash == null ? null : nextQuestStepRewardSiteHash,
        "timestampUnlockValueHash": timestampUnlockValueHash == null ? null : timestampUnlockValueHash,
        "isGlobalObjectiveItem": isGlobalObjectiveItem == null ? null : isGlobalObjectiveItem,
        "useOnObjectiveCompletion": useOnObjectiveCompletion == null ? null : useOnObjectiveCompletion,
        "inhibitCompletionUnlockValueHash": inhibitCompletionUnlockValueHash == null ? null : inhibitCompletionUnlockValueHash,
        "perObjectiveDisplayProperties": perObjectiveDisplayProperties == null ? null : List<dynamic>.from(perObjectiveDisplayProperties.map((x) => x.toJson())),
        "displayAsStatTracker": displayAsStatTracker == null ? null : displayAsStatTracker,
    };
}

class PerObjectiveDisplayProperty {
    PerObjectiveDisplayProperty({
        this.displayOnItemPreviewScreen,
    });

    bool displayOnItemPreviewScreen;

    factory PerObjectiveDisplayProperty.fromRawJson(String str) => PerObjectiveDisplayProperty.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PerObjectiveDisplayProperty.fromJson(Map<String, dynamic> json) => PerObjectiveDisplayProperty(
        displayOnItemPreviewScreen: json["displayOnItemPreviewScreen"] == null ? null : json["displayOnItemPreviewScreen"],
    );

    Map<String, dynamic> toJson() => {
        "displayOnItemPreviewScreen": displayOnItemPreviewScreen == null ? null : displayOnItemPreviewScreen,
    };
}

class Preview {
    Preview({
        this.screenStyle,
        this.previewVendorHash,
        this.previewActionString,
    });

    String screenStyle;
    int previewVendorHash;
    String previewActionString;

    factory Preview.fromRawJson(String str) => Preview.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Preview.fromJson(Map<String, dynamic> json) => Preview(
        screenStyle: json["screenStyle"] == null ? null : json["screenStyle"],
        previewVendorHash: json["previewVendorHash"] == null ? null : json["previewVendorHash"],
        previewActionString: json["previewActionString"] == null ? null : json["previewActionString"],
    );

    Map<String, dynamic> toJson() => {
        "screenStyle": screenStyle == null ? null : screenStyle,
        "previewVendorHash": previewVendorHash == null ? null : previewVendorHash,
        "previewActionString": previewActionString == null ? null : previewActionString,
    };
}

class Quality {
    Quality({
        this.itemLevels,
        this.qualityLevel,
        this.infusionCategoryName,
        this.infusionCategoryHash,
        this.infusionCategoryHashes,
        this.progressionLevelRequirementHash,
        this.currentVersion,
        this.versions,
        this.displayVersionWatermarkIcons,
    });

    List<dynamic> itemLevels;
    int qualityLevel;
    String infusionCategoryName;
    int infusionCategoryHash;
    List<int> infusionCategoryHashes;
    int progressionLevelRequirementHash;
    int currentVersion;
    List<Version> versions;
    List<String> displayVersionWatermarkIcons;

    factory Quality.fromRawJson(String str) => Quality.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Quality.fromJson(Map<String, dynamic> json) => Quality(
        itemLevels: json["itemLevels"] == null ? null : List<dynamic>.from(json["itemLevels"].map((x) => x)),
        qualityLevel: json["qualityLevel"] == null ? null : json["qualityLevel"],
        infusionCategoryName: json["infusionCategoryName"] == null ? null : json["infusionCategoryName"],
        infusionCategoryHash: json["infusionCategoryHash"] == null ? null : json["infusionCategoryHash"],
        infusionCategoryHashes: json["infusionCategoryHashes"] == null ? null : List<int>.from(json["infusionCategoryHashes"].map((x) => x)),
        progressionLevelRequirementHash: json["progressionLevelRequirementHash"] == null ? null : json["progressionLevelRequirementHash"],
        currentVersion: json["currentVersion"] == null ? null : json["currentVersion"],
        versions: json["versions"] == null ? null : List<Version>.from(json["versions"].map((x) => Version.fromJson(x))),
        displayVersionWatermarkIcons: json["displayVersionWatermarkIcons"] == null ? null : List<String>.from(json["displayVersionWatermarkIcons"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "itemLevels": itemLevels == null ? null : List<dynamic>.from(itemLevels.map((x) => x)),
        "qualityLevel": qualityLevel == null ? null : qualityLevel,
        "infusionCategoryName": infusionCategoryName == null ? null : infusionCategoryName,
        "infusionCategoryHash": infusionCategoryHash == null ? null : infusionCategoryHash,
        "infusionCategoryHashes": infusionCategoryHashes == null ? null : List<dynamic>.from(infusionCategoryHashes.map((x) => x)),
        "progressionLevelRequirementHash": progressionLevelRequirementHash == null ? null : progressionLevelRequirementHash,
        "currentVersion": currentVersion == null ? null : currentVersion,
        "versions": versions == null ? null : List<dynamic>.from(versions.map((x) => x.toJson())),
        "displayVersionWatermarkIcons": displayVersionWatermarkIcons == null ? null : List<dynamic>.from(displayVersionWatermarkIcons.map((x) => x)),
    };
}

class Version {
    Version({
        this.powerCapHash,
    });

    int powerCapHash;

    factory Version.fromRawJson(String str) => Version.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Version.fromJson(Map<String, dynamic> json) => Version(
        powerCapHash: json["powerCapHash"] == null ? null : json["powerCapHash"],
    );

    Map<String, dynamic> toJson() => {
        "powerCapHash": powerCapHash == null ? null : powerCapHash,
    };
}

class Sockets {
    Sockets({
        this.detail,
        this.socketEntries,
        this.intrinsicSockets,
        this.socketCategories,
    });

    String detail;
    List<SocketEntry> socketEntries;
    List<IntrinsicSocket> intrinsicSockets;
    List<SocketCategory> socketCategories;

    factory Sockets.fromRawJson(String str) => Sockets.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Sockets.fromJson(Map<String, dynamic> json) => Sockets(
        detail: json["detail"] == null ? null : json["detail"],
        socketEntries: json["socketEntries"] == null ? null : List<SocketEntry>.from(json["socketEntries"].map((x) => SocketEntry.fromJson(x))),
        intrinsicSockets: json["intrinsicSockets"] == null ? null : List<IntrinsicSocket>.from(json["intrinsicSockets"].map((x) => IntrinsicSocket.fromJson(x))),
        socketCategories: json["socketCategories"] == null ? null : List<SocketCategory>.from(json["socketCategories"].map((x) => SocketCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "detail": detail == null ? null : detail,
        "socketEntries": socketEntries == null ? null : List<dynamic>.from(socketEntries.map((x) => x.toJson())),
        "intrinsicSockets": intrinsicSockets == null ? null : List<dynamic>.from(intrinsicSockets.map((x) => x.toJson())),
        "socketCategories": socketCategories == null ? null : List<dynamic>.from(socketCategories.map((x) => x.toJson())),
    };
}

class IntrinsicSocket {
    IntrinsicSocket({
        this.plugItemHash,
        this.socketTypeHash,
        this.defaultVisible,
    });

    int plugItemHash;
    int socketTypeHash;
    bool defaultVisible;

    factory IntrinsicSocket.fromRawJson(String str) => IntrinsicSocket.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IntrinsicSocket.fromJson(Map<String, dynamic> json) => IntrinsicSocket(
        plugItemHash: json["plugItemHash"] == null ? null : json["plugItemHash"],
        socketTypeHash: json["socketTypeHash"] == null ? null : json["socketTypeHash"],
        defaultVisible: json["defaultVisible"] == null ? null : json["defaultVisible"],
    );

    Map<String, dynamic> toJson() => {
        "plugItemHash": plugItemHash == null ? null : plugItemHash,
        "socketTypeHash": socketTypeHash == null ? null : socketTypeHash,
        "defaultVisible": defaultVisible == null ? null : defaultVisible,
    };
}

class SocketCategory {
    SocketCategory({
        this.socketCategoryHash,
        this.socketIndexes,
    });

    int socketCategoryHash;
    List<int> socketIndexes;

    factory SocketCategory.fromRawJson(String str) => SocketCategory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SocketCategory.fromJson(Map<String, dynamic> json) => SocketCategory(
        socketCategoryHash: json["socketCategoryHash"] == null ? null : json["socketCategoryHash"],
        socketIndexes: json["socketIndexes"] == null ? null : List<int>.from(json["socketIndexes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "socketCategoryHash": socketCategoryHash == null ? null : socketCategoryHash,
        "socketIndexes": socketIndexes == null ? null : List<dynamic>.from(socketIndexes.map((x) => x)),
    };
}

class SocketEntry {
    SocketEntry({
        this.socketTypeHash,
        this.singleInitialItemHash,
        this.reusablePlugItems,
        this.preventInitializationOnVendorPurchase,
        this.preventInitializationWhenVersioning,
        this.hidePerksInItemTooltip,
        this.plugSources,
        this.reusablePlugSetHash,
        this.overridesUiAppearance,
        this.defaultVisible,
    });

    int socketTypeHash;
    int singleInitialItemHash;
    List<ReusablePlugItem> reusablePlugItems;
    bool preventInitializationOnVendorPurchase;
    bool preventInitializationWhenVersioning;
    bool hidePerksInItemTooltip;
    int plugSources;
    int reusablePlugSetHash;
    bool overridesUiAppearance;
    bool defaultVisible;

    factory SocketEntry.fromRawJson(String str) => SocketEntry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SocketEntry.fromJson(Map<String, dynamic> json) => SocketEntry(
        socketTypeHash: json["socketTypeHash"] == null ? null : json["socketTypeHash"],
        singleInitialItemHash: json["singleInitialItemHash"] == null ? null : json["singleInitialItemHash"],
        reusablePlugItems: json["reusablePlugItems"] == null ? null : List<ReusablePlugItem>.from(json["reusablePlugItems"].map((x) => ReusablePlugItem.fromJson(x))),
        preventInitializationOnVendorPurchase: json["preventInitializationOnVendorPurchase"] == null ? null : json["preventInitializationOnVendorPurchase"],
        preventInitializationWhenVersioning: json["preventInitializationWhenVersioning"] == null ? null : json["preventInitializationWhenVersioning"],
        hidePerksInItemTooltip: json["hidePerksInItemTooltip"] == null ? null : json["hidePerksInItemTooltip"],
        plugSources: json["plugSources"] == null ? null : json["plugSources"],
        reusablePlugSetHash: json["reusablePlugSetHash"] == null ? null : json["reusablePlugSetHash"],
        overridesUiAppearance: json["overridesUiAppearance"] == null ? null : json["overridesUiAppearance"],
        defaultVisible: json["defaultVisible"] == null ? null : json["defaultVisible"],
    );

    Map<String, dynamic> toJson() => {
        "socketTypeHash": socketTypeHash == null ? null : socketTypeHash,
        "singleInitialItemHash": singleInitialItemHash == null ? null : singleInitialItemHash,
        "reusablePlugItems": reusablePlugItems == null ? null : List<dynamic>.from(reusablePlugItems.map((x) => x.toJson())),
        "preventInitializationOnVendorPurchase": preventInitializationOnVendorPurchase == null ? null : preventInitializationOnVendorPurchase,
        "preventInitializationWhenVersioning": preventInitializationWhenVersioning == null ? null : preventInitializationWhenVersioning,
        "hidePerksInItemTooltip": hidePerksInItemTooltip == null ? null : hidePerksInItemTooltip,
        "plugSources": plugSources == null ? null : plugSources,
        "reusablePlugSetHash": reusablePlugSetHash == null ? null : reusablePlugSetHash,
        "overridesUiAppearance": overridesUiAppearance == null ? null : overridesUiAppearance,
        "defaultVisible": defaultVisible == null ? null : defaultVisible,
    };
}

class ReusablePlugItem {
    ReusablePlugItem({
        this.plugItemHash,
    });

    int plugItemHash;

    factory ReusablePlugItem.fromRawJson(String str) => ReusablePlugItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReusablePlugItem.fromJson(Map<String, dynamic> json) => ReusablePlugItem(
        plugItemHash: json["plugItemHash"] == null ? null : json["plugItemHash"],
    );

    Map<String, dynamic> toJson() => {
        "plugItemHash": plugItemHash == null ? null : plugItemHash,
    };
}

class Stats {
    Stats({
        this.disablePrimaryStatDisplay,
        this.statGroupHash,
        this.stats,
        this.hasDisplayableStats,
        this.primaryBaseStatHash,
    });

    bool disablePrimaryStatDisplay;
    int statGroupHash;
    Map<String, Stat> stats;
    bool hasDisplayableStats;
    int primaryBaseStatHash;

    factory Stats.fromRawJson(String str) => Stats.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        disablePrimaryStatDisplay: json["disablePrimaryStatDisplay"] == null ? null : json["disablePrimaryStatDisplay"],
        statGroupHash: json["statGroupHash"] == null ? null : json["statGroupHash"],
        stats: json["stats"] == null ? null : Map.from(json["stats"]).map((k, v) => MapEntry<String, Stat>(k, Stat.fromJson(v))),
        hasDisplayableStats: json["hasDisplayableStats"] == null ? null : json["hasDisplayableStats"],
        primaryBaseStatHash: json["primaryBaseStatHash"] == null ? null : json["primaryBaseStatHash"],
    );

    Map<String, dynamic> toJson() => {
        "disablePrimaryStatDisplay": disablePrimaryStatDisplay == null ? null : disablePrimaryStatDisplay,
        "statGroupHash": statGroupHash == null ? null : statGroupHash,
        "stats": stats == null ? null : Map.from(stats).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "hasDisplayableStats": hasDisplayableStats == null ? null : hasDisplayableStats,
        "primaryBaseStatHash": primaryBaseStatHash == null ? null : primaryBaseStatHash,
    };
}

class Stat {
    Stat({
        this.statHash,
        this.value,
        this.minimum,
        this.maximum,
        this.displayMaximum,
    });

    int statHash;
    int value;
    int minimum;
    int maximum;
    int displayMaximum;

    factory Stat.fromRawJson(String str) => Stat.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        statHash: json["statHash"] == null ? null : json["statHash"],
        value: json["value"] == null ? null : json["value"],
        minimum: json["minimum"] == null ? null : json["minimum"],
        maximum: json["maximum"] == null ? null : json["maximum"],
        displayMaximum: json["displayMaximum"] == null ? null : json["displayMaximum"],
    );

    Map<String, dynamic> toJson() => {
        "statHash": statHash == null ? null : statHash,
        "value": value == null ? null : value,
        "minimum": minimum == null ? null : minimum,
        "maximum": maximum == null ? null : maximum,
        "displayMaximum": displayMaximum == null ? null : displayMaximum,
    };
}

class TalentGrid {
    TalentGrid({
        this.talentGridHash,
        this.itemDetailString,
        this.hudDamageType,
    });

    int talentGridHash;
    String itemDetailString;
    int hudDamageType;

    factory TalentGrid.fromRawJson(String str) => TalentGrid.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TalentGrid.fromJson(Map<String, dynamic> json) => TalentGrid(
        talentGridHash: json["talentGridHash"] == null ? null : json["talentGridHash"],
        itemDetailString: json["itemDetailString"] == null ? null : json["itemDetailString"],
        hudDamageType: json["hudDamageType"] == null ? null : json["hudDamageType"],
    );

    Map<String, dynamic> toJson() => {
        "talentGridHash": talentGridHash == null ? null : talentGridHash,
        "itemDetailString": itemDetailString == null ? null : itemDetailString,
        "hudDamageType": hudDamageType == null ? null : hudDamageType,
    };
}

class TranslationBlock {
    TranslationBlock({
        this.weaponPatternHash,
        this.defaultDyes,
        this.lockedDyes,
        this.customDyes,
        this.arrangements,
        this.hasGeometry,
    });

    int weaponPatternHash;
    List<dynamic> defaultDyes;
    List<LockedDye> lockedDyes;
    List<dynamic> customDyes;
    List<Arrangement> arrangements;
    bool hasGeometry;

    factory TranslationBlock.fromRawJson(String str) => TranslationBlock.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TranslationBlock.fromJson(Map<String, dynamic> json) => TranslationBlock(
        weaponPatternHash: json["weaponPatternHash"] == null ? null : json["weaponPatternHash"],
        defaultDyes: json["defaultDyes"] == null ? null : List<dynamic>.from(json["defaultDyes"].map((x) => x)),
        lockedDyes: json["lockedDyes"] == null ? null : List<LockedDye>.from(json["lockedDyes"].map((x) => LockedDye.fromJson(x))),
        customDyes: json["customDyes"] == null ? null : List<dynamic>.from(json["customDyes"].map((x) => x)),
        arrangements: json["arrangements"] == null ? null : List<Arrangement>.from(json["arrangements"].map((x) => Arrangement.fromJson(x))),
        hasGeometry: json["hasGeometry"] == null ? null : json["hasGeometry"],
    );

    Map<String, dynamic> toJson() => {
        "weaponPatternHash": weaponPatternHash == null ? null : weaponPatternHash,
        "defaultDyes": defaultDyes == null ? null : List<dynamic>.from(defaultDyes.map((x) => x)),
        "lockedDyes": lockedDyes == null ? null : List<dynamic>.from(lockedDyes.map((x) => x.toJson())),
        "customDyes": customDyes == null ? null : List<dynamic>.from(customDyes.map((x) => x)),
        "arrangements": arrangements == null ? null : List<dynamic>.from(arrangements.map((x) => x.toJson())),
        "hasGeometry": hasGeometry == null ? null : hasGeometry,
    };
}

class Arrangement {
    Arrangement({
        this.classHash,
        this.artArrangementHash,
    });

    int classHash;
    int artArrangementHash;

    factory Arrangement.fromRawJson(String str) => Arrangement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Arrangement.fromJson(Map<String, dynamic> json) => Arrangement(
        classHash: json["classHash"] == null ? null : json["classHash"],
        artArrangementHash: json["artArrangementHash"] == null ? null : json["artArrangementHash"],
    );

    Map<String, dynamic> toJson() => {
        "classHash": classHash == null ? null : classHash,
        "artArrangementHash": artArrangementHash == null ? null : artArrangementHash,
    };
}

class LockedDye {
    LockedDye({
        this.channelHash,
        this.dyeHash,
    });

    int channelHash;
    int dyeHash;

    factory LockedDye.fromRawJson(String str) => LockedDye.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LockedDye.fromJson(Map<String, dynamic> json) => LockedDye(
        channelHash: json["channelHash"] == null ? null : json["channelHash"],
        dyeHash: json["dyeHash"] == null ? null : json["dyeHash"],
    );

    Map<String, dynamic> toJson() => {
        "channelHash": channelHash == null ? null : channelHash,
        "dyeHash": dyeHash == null ? null : dyeHash,
    };
}