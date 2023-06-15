package com.fas.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmailLoginDto {
    @NotNull
    @Email
    private String email;
    @NotNull
    private String emailCode;
}
