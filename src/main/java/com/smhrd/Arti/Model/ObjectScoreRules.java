package com.smhrd.Arti.Model;

import java.util.HashMap;
import java.util.Map;

public class ObjectScoreRules {

    public static Map<String, Map<String, Integer>> getRules() {
        Map<String, Map<String, Integer>> rules = new HashMap<>();

        // "집전체" 규칙
        Map<String, Integer> houseRules = new HashMap<>();
        houseRules.put("large_area", 1); // 공격성, 사회불안
        houseRules.put("small_area", 1); // 우울, 자존감, 정서불안 등
        houseRules.put("left_position", 1); // 자존감, 애정결핍
        houseRules.put("right_position", 1); // 공격성
        houseRules.put("bottom_position", 1); // 우울 등
        rules.put("집전체", houseRules);

        // "창문" 규칙
        Map<String, Integer> windowRules = new HashMap<>();
        windowRules.put("no_window", 1); // 대인회피 등
        windowRules.put("many_windows", 1); // 사회불안 등
        rules.put("창문", windowRules);

        // "문" 규칙
        Map<String, Integer> doorRules = new HashMap<>();
        doorRules.put("no_door", 1); // 사회불안 등
        rules.put("문", doorRules);

        // "굴뚝" 규칙
        Map<String, Integer> chimneyRules = new HashMap<>();
        chimneyRules.put("exists", 1); // 우울, 자존감
        rules.put("굴뚝", chimneyRules);

        // "산" 규칙
        Map<String, Integer> mountainRules = new HashMap<>();
        mountainRules.put("with_trees", 1); // 사회불안, 대인회피
        rules.put("산", mountainRules);

        // "나무" 규칙
        Map<String, Integer> treeRules = new HashMap<>();
        treeRules.put("large_area", 1); // 공격성
        treeRules.put("small_area", 1); // 우울, 대인회피, 자존감 등
        treeRules.put("left_position", 1); // 대인회피, 애정결핍
        treeRules.put("right_position", 1); // 공격성
        treeRules.put("bottom_position", 1); // 우울 등
        treeRules.put("many_branches", 1); // 공격성, 사회불안
        treeRules.put("few_branches", 1); // 우울, 대인회피 등
        treeRules.put("many_fruits", 1); // 사회불안, 정서불안 등
        rules.put("나무", treeRules);

        // "울타리" 규칙
        Map<String, Integer> fenceRules = new HashMap<>();
        fenceRules.put("exists", 1); // 사회불안, 대인회피, 자존감 등
        rules.put("울타리", fenceRules);

        // "연못" 규칙
        Map<String, Integer> pondRules = new HashMap<>();
        pondRules.put("exists", 1); // 우울, 자존감, 정서불안
        rules.put("연못", pondRules);

        // "태양" 규칙
        Map<String, Integer> sunRules = new HashMap<>();
        sunRules.put("exists", 1); // 긍정적 정서 증가
        sunRules.put("missing", -1); // 우울
        rules.put("태양", sunRules);

        // "구름" 규칙
        Map<String, Integer> cloudRules = new HashMap<>();
        cloudRules.put("many_clouds", 1); // 우울, 정서불안
        cloudRules.put("no_clouds", -1); // 긍정적 정서
        rules.put("구름", cloudRules);

        // "동물" 규칙
        Map<String, Integer> animalRules = new HashMap<>();
        animalRules.put("exists", 1); // 긍정적 정서, 자존감
        animalRules.put("missing", -1); // 애정결핍
        rules.put("동물", animalRules);
        
        // "사람전체" 규칙
        Map<String, Integer> personRules = new HashMap<>();
        personRules.put("large_area", 1); // 공격성
        personRules.put("small_area", 1); // 사회불안, 우울, 대인회피 등
        personRules.put("left_position", 1); // 애정결핍, 열등감
        personRules.put("right_position", 1); // 공격성, 사회불안 등
        personRules.put("bottom_position", 1); // 사회불안, 우울 등
        personRules.put("no_face", 1); // 사회불안, 우울, 대인회피 등
        personRules.put("no_mouth", 1); // 사회불안, 정서불안
        personRules.put("no_nose", 1); // 사회불안
        personRules.put("no_neck", 1); // 공격성, 퇴행
        personRules.put("no_arms", 1); // 우울, 대인회피 등
        personRules.put("no_feet", 1); // 사회불안, 우울 등
        rules.put("사람전체", personRules);

        return rules;
    }
}
