package com.example.conexaPrimeiroDesafio.service.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
public class Film {
      private String title;
      @JsonProperty("episode_id")
      private Integer episodeId;
      private String director;
      @JsonProperty("release_date")
      private LocalDate releaseDate;
}
