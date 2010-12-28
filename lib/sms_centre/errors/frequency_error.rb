#'Попытка отправки более двух одинаковых запросов в течение минуты'

module SmsCentre
  class FrequencyError < ApiError
  end
end
