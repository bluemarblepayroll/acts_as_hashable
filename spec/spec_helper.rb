# frozen_string_literal: true

#
# Copyright (c) 2018-present, Blue Marble Payroll, LLC
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#

require 'simplecov'
require 'simplecov-console'

require './lib/acts_as_hashable'
require './spec/examples'

SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start
