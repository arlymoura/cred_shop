import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="salary"
export default class extends Controller {
  static targets = ["salaryInput", "inssOutput"];
  static values = { url: String };

  connect() {
    this.timeout = null; // Para debounce
  }

  calculate() {
    clearTimeout(this.timeout); // Cancela o timeout anterior

    const salary = parseFloat(this.salaryInputTarget.value); // Usa o target
    if (isNaN(salary) || salary <= 0) {
      this.inssOutputTarget.value = "Valor inválido";
      return;
    }

    // Debounce para evitar requisições excessivas
    this.timeout = setTimeout(() => {
      fetch(`${this.urlValue}?salary=${salary}`)
        .then((response) => response.json())
        .then((data) => {
          if (data.inss) {
            this.inssOutputTarget.value = `R$ ${data.inss}`;
          } else {
            this.inssOutputTarget.value = data.error || "Erro ao calcular";
          }
        })
        .catch(() => {
          this.inssOutputTarget.value = "Erro na requisição";
        });
    }, 500);
  }
}
