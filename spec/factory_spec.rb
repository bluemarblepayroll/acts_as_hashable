# frozen_string_literal: true

#
# Copyright (c) 2018-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require './spec/spec_helper'

describe ActsAsHashable::Factory do
  subject { ExampleFactory }

  describe '#make' do
    context 'when registered object is a string' do
      it 'does not raise error' do
        expect { ExampleFactory.make(object_type: 'Toy') }.not_to raise_error
      end

      it 'instantiates correct class' do
        toy = ExampleFactory.make(object_type: 'Toy')

        expect(toy).to be_a(Toy)
      end
    end

    context 'when hydrating classes argument-less constructors' do
      it 'calls constructor with no arguments' do
        expect { ExampleFactory.make(object_type: :class_with_no_arguments) }.not_to raise_error
      end
    end

    it 'should hydrate example objects' do
      objects = [
        {
          object_type: 'Pet',
          name: 'Doug the dog',
          toy: { squishy: true }
        },
        {
          object_type: 'HeadOfHousehold',
          person: {
            name: 'Matt',
            age: 109
          },
          partner: {
            name: 'Katie',
            age: 110
          }
        }
      ]

      hydrated_objects = subject.array(objects)

      pet_obj = hydrated_objects.first

      expect(pet_obj.name).to eq('Doug the dog')
      expect(pet_obj.toy.squishy).to be true

      head_of_household_obj = hydrated_objects.last

      expect(head_of_household_obj.person.name).to eq('Matt')
      expect(head_of_household_obj.person.age).to eq(109)
      expect(head_of_household_obj.partner.name).to eq('Katie')
      expect(head_of_household_obj.partner.age).to eq(110)
    end
  end
end
