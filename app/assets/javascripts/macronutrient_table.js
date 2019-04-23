class MacronutrientTable {
  constructor(carbohydrateGrams, carbohydratePercent, proteinGrams, proteinPercent, fatGrams, fatPercent) {
    this.carbohydrateGrams = carbohydrateGrams,
    this.carbohydratePercent = carbohydratePercent,
    this.proteinGrams = proteinGrams,
    this.proteinPercent = proteinPercent,
    this.fatGrams = fatGrams,
    this.fatPercent = fatPercent
  }
  updateTable() {
    $('tr td')[1].innerHTML = this.carbohydrateGrams
    $('tr td')[2].innerHTML = this.carbohydratePercent
    $('tr td')[4].innerHTML = this.proteinGrams
    $('tr td')[5].innerHTML = this.proteinPercent
    $('tr td')[7].innerHTML = this.fatGrams
    $('tr td')[8].innerHTML = this.fatPercent
  }
}
