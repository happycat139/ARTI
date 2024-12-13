package com.smhrd.Arti.Model;

import java.util.HashMap;
import java.util.Map;

public class ObjectScoreRules {

    public static Map<String, Map<String, Integer>> getRules() {
        Map<String, Map<String, Integer>> rules = new HashMap<>();

        // "집전체" 규칙
        rules.put("집전체", Map.of(
            "large_area", 2,  // 지나치게 큰 경우
            "small_area", 3,  // 지나치게 작은 경우
            "left_position", 1,  // 좌측에 위치
            "right_position", 2,  // 우측에 위치
            "bottom_position", 3  // 하단에 위치
        ));

        // "지붕" 규칙
        rules.put("지붕", Map.of(
            "large_area", 1,  // 크기가 큰 경우
            "small_area", 2,  // 크기가 작은 경우
            "no_roof", 3  // 지붕이 없는 경우
        ));

        // "창문" 규칙
        rules.put("창문", Map.of(
            "no_window", 4,  // 창문 없음
            "many_windows", 2,  // 창문이 많음 (예: 4개 이상)
            "small_window", 1  // 창문이 작음
        ));

        // "문" 규칙
        rules.put("문", Map.of(
            "no_door", 3,  // 문 없음
            "many_doors", 1  // 문이 많음
        ));

        // "굴뚝" 규칙
        rules.put("굴뚝", Map.of(
            "exists", 1,  // 굴뚝이 존재할 경우
            "no_chimney", 2  // 굴뚝이 없을 경우
        ));

        // "울타리" 규칙
        rules.put("울타리", Map.of(
            "exists", 2,  // 울타리가 존재할 경우
            "no_fence", 3  // 울타리가 없을 경우
        ));

        // "나무" 규칙
        rules.put("나무", Map.of(
            "many_trees", 2,  // 나무가 많음 (5개 이상)
            "single_tree", 1,  // 나무가 1개만 있음
            "no_tree", 3  // 나무 없음
        ));

        // "연기" 규칙
        rules.put("연기", Map.of(
            "exists", 1,  // 연기가 있을 경우
            "no_smoke", 2  // 연기가 없을 경우
        ));

        // "태양" 규칙
        rules.put("태양", Map.of(
            "exists", 1,  // 태양이 있을 경우
            "no_sun", 2  // 태양이 없을 경우
        ));

        // "사람" 규칙
        rules.put("사람전체", Map.of(
            "small_person", 2,  // 사람이 지나치게 작을 경우
            "large_person", 1,  // 사람이 지나치게 클 경우
            "no_face", 4,  // 얼굴이 없음
            "missing_arms", 3,  // 팔이 없음
            "missing_legs", 3,  // 다리가 없음
            "missing_features", 5  // 주요 신체 부위가 없음
        ));

        // "강아지" 규칙
        rules.put("강아지", Map.of(
            "exists", 1,  // 강아지가 있을 경우
            "no_dog", 2  // 강아지가 없을 경우
        ));

        // "연못" 규칙
        rules.put("연못", Map.of(
            "exists", 1,  // 연못이 있을 경우
            "no_pond", 2  // 연못이 없을 경우
        ));

        // "집벽" 규칙
        rules.put("집벽", Map.of(
            "large_area", 1,  // 집벽이 지나치게 큰 경우
            "small_area", 2,  // 집벽이 지나치게 작은 경우
            "no_walls", 3,  // 집벽이 없는 경우
            "center_position", 1,  // 집벽이 화면 중앙에 위치
            "many_walls", 2  // 집벽이 많음 (분리된 구조일 경우)
        ));
        
        rules.put("차량", Map.of(
            "exists", 1,  // 차량이 있을 경우
            "no_vehicle", 2  // 차량이 없을 경우
        ));

        rules.put("새", Map.of(
            "many_birds", 2,  // 새가 많음
            "single_bird", 1  // 새가 1마리만 있음
        ));

        return rules;
    }
}
