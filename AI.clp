(deffacts fakta_awal "Fakta awal" (belum_prediksi))

(deffunction query-number "Query a number"
    (?prompt)
    (bind ?ret FALSE)
    (while (not ?ret)
        (printout t ?prompt)
        (bind ?ret (read-number t))
    )
    (return ?ret)
)

(defrule path_init
    (belum_prediksi)
    =>
    (assert (mean_concave_points (query-number "mean_concave_points ? ")))
)

(defrule path_1
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (belum_prediksi)
    =>
    (assert (worst_perimeter (query-number "worst_perimeter ? ")))
)

(defrule path_10
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (worst_perimeter ?b)
    (test (<= ?b 114.45))
    (belum_prediksi)
    =>
    (assert (worst_texture (query-number "worst_texture ? ")))
)

(defrule path_100
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (worst_perimeter ?b)
    (test (<= ?b 114.45))
    (worst_texture ?c)
    (test (<= ?c 25.65))
    (belum_prediksi)
    =>
    (assert (worst_concave_points (query-number "worst_concave_points ? ")))
)

(defrule path_1000
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (worst_perimeter ?b)
    (test (<= ?b 114.45))
    (worst_texture ?c)
    (test (<= ?c 25.65))
    (worst_concave_points ?d)
    (test (<= ?d 0.17))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 1))
)

(defrule path_1001
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (worst_perimeter ?b)
    (test (<= ?b 114.45))
    (worst_texture ?c)
    (test (<= ?c 25.65))
    (worst_concave_points ?d)
    (test (> ?d 0.17))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 0))
)

(defrule path_101
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (worst_perimeter ?b)
    (test (<= ?b 114.45))
    (worst_texture ?c)
    (test (> ?c 25.65))
    (belum_prediksi)
    =>
    (assert (perimeter_error (query-number "perimeter_error ? ")))
)

(defrule path_1010
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (worst_perimeter ?b)
    (test (<= ?b 114.45))
    (worst_texture ?c)
    (test (> ?c 25.65))
    (perimeter_error ?d)
    (test (<= ?d 1.56))
    (belum_prediksi)
    =>
    (assert (mean_radius (query-number "mean_radius ? ")))
)

(defrule path_10100
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (worst_perimeter ?b)
    (test (<= ?b 114.45))
    (worst_texture ?c)
    (test (> ?c 25.65))
    (perimeter_error ?d)
    (test (<= ?d 1.56))
    (mean_radius ?e)
    (test (<= ?e 13.34))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 0))
)

(defrule path_10101
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (worst_perimeter ?b)
    (test (<= ?b 114.45))
    (worst_texture ?c)
    (test (> ?c 25.65))
    (perimeter_error ?d)
    (test (<= ?d 1.56))
    (mean_radius ?e)
    (test (> ?e 13.34))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 1))
)

(defrule path_1011
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (worst_perimeter ?b)
    (test (<= ?b 114.45))
    (worst_texture ?c)
    (test (> ?c 25.65))
    (perimeter_error ?d)
    (test (> ?d 1.56))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 0))
)

(defrule path_11
    (mean_concave_points ?a)
    (test (> ?a 0.05))
    (worst_perimeter ?b)
    (test (> ?b 114.45))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 0))
)


(defrule path_0
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (belum_prediksi)
    =>
    (assert (worst_radius (query-number "worst_radius ? ")))
)

(defrule path_00
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (belum_prediksi)
    =>
    (assert (radius_error (query-number "radius_error ? ")))
)

(defrule path_000
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (<= ?re 0.63))
    (belum_prediksi)
    =>
    (assert (worst_texture (query-number "worst_texture ? ")))
)

(defrule path_0000
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (<= ?re 0.63))
    (worst_texture ?wt)
    (test (<= ?wt 30.15))
    ?bp <-(belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 1))
)

(defrule path_0001
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (<= ?re 0.63))
    (worst_texture ?wt)
    (test (> ?wt 30.15))
    (belum_prediksi)
    =>
    (assert (worst_area (query-number "worst_area ? ")))
)

(defrule path_00010
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (<= ?re 0.63))
    (worst_texture ?wt)
    (test (> ?wt 30.15))
    (worst_area ?wa)
    (test (<= ?wa 641.60))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 1))
)

(defrule path_00011
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (<= ?re 0.63))
    (worst_texture ?wt)
    (test (> ?wt 30.15))
    (worst_area ?wa)
    (test (> ?wa 641.60))
    (belum_prediksi)
    =>
    (assert (mean_radius (query-number "mean_radius ? ")))
)

(defrule path_000110
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (<= ?re 0.63))
    (worst_texture ?wt)
    (test (> ?wt 30.15))
    (worst_area ?wa)
    (test (> ?wa 641.60))
    (mean_radius ?mr)
    (test (<= ?mr 13.45))
    (belum_prediksi)
    =>
    (assert (mean_texture (query-number "mean_texture ? ")))
)

(defrule path_0001100
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (<= ?re 0.63))
    (worst_texture ?wt)
    (test (> ?wt 30.15))
    (worst_area ?wa)
    (test (> ?wa 641.60))
    (mean_radius ?mr)
    (test (<= ?mr 13.45))
    (mean_texture ?mt)
    (test (<= ?mt 28.79))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 0))
)

(defrule path_0001101
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (<= ?re 0.63))
    (worst_texture ?wt)
    (test (> ?wt 30.15))
    (worst_area ?wa)
    (test (> ?wa 641.60))
    (mean_radius ?mr)
    (test (<= ?mr 13.45))
    (mean_texture ?mt)
    (test (> ?mt 28.79))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 1))
)

(defrule path_000111
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (<= ?re 0.63))
    (worst_texture ?wt)
    (test (> ?wt 30.15))
    (worst_area ?wa)
    (test (> ?wa 641.60))
    (mean_radius ?mr)
    (test (> ?mr 13.45))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 1))
)

(defrule path_001
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (> ?re 0.63))
    (belum_prediksi)
    =>
    (assert (mean_smoothness (query-number "mean_smoothness ? ")))
)

(defrule path_0010
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (> ?re 0.63))
    (mean_smoothness ?ms)
    (test (<= ?ms 0.09))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 1))
)

(defrule path_0011
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (<= ?wr 16.83))
    (radius_error ?re)
    (test (> ?re 0.63))
    (mean_smoothness ?ms)
    (test (> ?ms 0.09))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 0))
)

(defrule path_01
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (> ?wr 16.83))
    (belum_prediksi)
    =>
    (assert (mean_texture (query-number "mean_texture ? ")))
)

(defrule path_010
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (> ?wr 16.83))
    (mean_texture ?mt)
    (test (<= ?mt 16.19))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 1))
)

(defrule path_011
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (> ?wr 16.83))
    (mean_texture ?mt)
    (test (> ?mt 16.19))
    (belum_prediksi)
    =>
    (assert (concave_points_error (query-number "concave_points_error ? ")))
)

(defrule path_0110
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (> ?wr 16.83))
    (mean_texture ?mt)
    (test (> ?mt 16.19))
    (concave_points_error ?cpe)
    (test (<= ?cpe 0.01))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 0))
)

(defrule path_0111
    (mean_concave_points ?a)
    (test (<= ?a 0.05))
    (worst_radius ?wr)
    (test (> ?wr 16.83))
    (mean_texture ?mt)
    (test (> ?mt 16.19))
    (concave_points_error ?cpe)
    (test (> ?cpe 0.01))
    ?bp <- (belum_prediksi)
    =>
    (retract ?bp)
    (assert (hasil_prediksi 1))
)

(defrule hasil_prediksi "Hasil prediksi"
    (hasil_prediksi ?pred)
    =>
    (printout t
        "Hasil prediksi : "
        (if (= ?pred 0.0)
            then
            "Bukan kanker"
            else
            "Kanker payudara"
        )
        crlf
    )
)

(defrule tidak_prediksi "Tidak ada prediksi"
    (declare (salience -100))
    (belum_prediksi)
    =>
    (printout t "Tidak ada prediksi yang cocok" crlf)
)
