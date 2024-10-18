package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CarDto {
    private String carId;  // carId를 String으로 유지
    private String carModel;
    private BigDecimal carPrice;  // 가격 필드는 BigDecimal을 사용
    private String imgName;
    private LocalDateTime carRegDate;
}
