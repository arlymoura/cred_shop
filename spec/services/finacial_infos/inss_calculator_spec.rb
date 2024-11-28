require 'rails_helper'

RSpec.describe FinancialInfos::InssCalculator, type: :service do
  describe '#call' do
    context 'when the salary is invalid' do
      it 'raises an error if the salary is negative' do
        expect { FinancialInfos::InssCalculator.call(-1000.00) }.to raise_error(ArgumentError, "O salário deve ser um número positivo")
      end

      it 'raises an error if the salary is zero' do
        expect { FinancialInfos::InssCalculator.call(0.00) }.to raise_error(ArgumentError, "O salário deve ser um número positivo")
      end

      it 'raises an error if the salary is nil' do
        expect { FinancialInfos::InssCalculator.call(nil) }.to raise_error(ArgumentError, "O salário deve ser um número positivo")
      end
    end

    context 'when the salary is valid' do
      it 'correctly calculates the INSS for a salary of R$ 1.045,00' do
        result = FinancialInfos::InssCalculator.call(1045.00)
        expect(result).to eq(78.37)
      end

      it 'correctly calculates the INSS for a salary of R$ 2.000,00' do
        result = FinancialInfos::InssCalculator.call(2000.00)
        expect(result).to eq(164.32)
      end

      it 'correctly calculates the INSS for a salary of R$ 3.000,00' do
        result = FinancialInfos::InssCalculator.call(3000.00)
        expect(result).to eq(281.62)
      end

      it 'correctly calculates the INSS for a salary of R$ 6.000,00' do
        result = FinancialInfos::InssCalculator.call(6000.00)
        expect(result).to eq(698.93)
      end

      it 'correctly calculates the INSS for a salary of R$ 7.000,00' do
        result = FinancialInfos::InssCalculator.call(7000.00)
        expect(result).to eq(713.08)
      end
    end
  end
end
