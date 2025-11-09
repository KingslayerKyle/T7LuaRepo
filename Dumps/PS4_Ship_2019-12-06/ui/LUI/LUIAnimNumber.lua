LUI.UIAnimNumber = {}
LUI.UIAnimNumber.new = function ( f1_arg0 )
	local self = LUI.UIText.new( f1_arg0 )
	self.setNumber = LUI.UIAnimNumber.SetNumber
	self.setLocalizedString = LUI.UIAnimNumber.SetLocalizedString
	self.layout = LUI.UIAnimNumber.Layout
	return self
end

LUI.UIAnimNumber.SetNumber = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg2 == nil or f2_arg0.currentNumber == nil then
		f2_arg0.currentNumber = f2_arg1
		f2_arg0:setText( f2_arg1 )
		return 
	else
		f2_arg0.startingNumber = f2_arg0.currentNumber
		f2_arg0.numberChange = f2_arg1 - f2_arg0.startingNumber
		f2_arg0.timeLeft = f2_arg2
		f2_arg0.duration = f2_arg2
		f2_arg0:setLayoutCached( false )
	end
end

LUI.UIAnimNumber.SetLocalizedString = function ( f3_arg0, f3_arg1 )
	f3_arg0.localizedString = f3_arg1
end

LUI.UIAnimNumber.Layout = function ( f4_arg0, f4_arg1 )
	local f4_local0 = true
	if f4_arg0.timeLeft ~= nil then
		local f4_local1 = f4_arg0.timeLeft - f4_arg1.deltaTime
		local f4_local2 = nil
		if f4_local1 < 0 then
			f4_local2 = f4_arg0.startingNumber + f4_arg0.numberChange
			f4_arg0.startingNumber = nil
			f4_arg0.numberChange = nil
			f4_arg0.timeLeft = nil
			f4_arg0.duration = nil
		else
			f4_arg0.timeLeft = f4_local1
			f4_local2 = math.floor( f4_arg0.startingNumber + f4_arg0.numberChange * (1 - f4_local1 / f4_arg0.duration) + 0.5 )
		end
		local f4_local3 = f4_arg0.localizedString
		if f4_local3 ~= nil then
			f4_arg0:setText( Engine.Localize( f4_local3, f4_local2 ) )
		else
			f4_arg0:setText( f4_local2 )
		end
		f4_arg0.currentNumber = f4_local2
		f4_local0 = false
	end
	f4_local0 = f4_arg0:updateElementLayout( f4_arg1 ) and f4_local0
	f4_arg0:layoutChildren( f4_arg1 )
	f4_arg0:setLayoutCached( f4_local0 )
end

