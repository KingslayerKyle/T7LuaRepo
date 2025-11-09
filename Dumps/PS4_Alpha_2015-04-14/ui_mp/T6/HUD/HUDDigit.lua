CoD.HUDDigit = InheritFrom( LUI.UIElement )
CoD.HUDDigit.Width = 32
CoD.HUDDigit.Spacing = 22
CoD.HUDDigit.BigBottomNumbersY = -87
CoD.HUDDigit.BigNumbersHeight = 64
CoD.HUDDigit.SmallDigitScale = 0.75
CoD.HUDDigit.SmallDigitHeightOffset = 4
CoD.HUDDigit.SmallDigitHeightDifference = 12
CoD.HUDDigit.SmallNumbersHeight = CoD.HUDDigit.BigNumbersHeight * CoD.HUDDigit.SmallDigitScale
CoD.HUDDigit.Slash = 10
CoD.HUDDigit.Line = 11
local RegisterDigitMaterials, DigitBackgroundMaterials, DigitForegroundMaterials = nil
local Digit_PulseRedDuration = 500
local Digit_TransitionCompleteNormal, DigitBackground_TransitionCompletePulseRed, DigitForeground_TransitionCompletePulseRed = nil
CoD.HUDDigit.new = function ()
	RegisterDigitMaterials()
	local self = LUI.UIElement.new()
	self:setClass( CoD.HUDDigit )
	self.foreground = LUI.UIImage.new()
	self.foreground:setLeftRight( true, true, 0, 0 )
	self.foreground:setTopBottom( true, true, 0, 0 )
	self.foreground:registerEventHandler( "transition_complete_normal", Digit_TransitionCompleteNormal )
	self.foreground:registerEventHandler( "transition_complete_pulse_red", DigitForeground_TransitionCompletePulseRed )
	self:addElement( self.foreground )
	if CoD.isZombie == false then
		self.background = LUI.UIImage.new()
		self.background:setLeftRight( true, true, 0, 0 )
		self.background:setTopBottom( true, true, 0, 0 )
		self.background:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		self.background:setAlpha( 0.6 )
		self.background:registerEventHandler( "transition_complete_normal", Digit_TransitionCompleteNormal )
		self.background:registerEventHandler( "transition_complete_pulse_red", DigitBackground_TransitionCompletePulseRed )
		self:addElement( self.background )
	end
	return self
end

RegisterDigitMaterials = function ()
	if not DigitBackgroundMaterials then
		if CoD.isZombie == true then
			local digitID = ""
			if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC2Maps ) then
				digitID = "hell_"
			elseif CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) then
				digitID = "buried_"
			elseif CoD.Zombie.IsDLCMap( CoD.Zombie.DLC4Maps ) then
				digitID = "tomb_"
			end
			DigitBackgroundMaterials = {}
			local f2_local0 = {}
			local f2_local1 = RegisterMaterial( "hud_zm_num_" .. digitID .. "0" )
			local f2_local2 = RegisterMaterial( "hud_zm_num_" .. digitID .. "1" )
			local f2_local3 = RegisterMaterial( "hud_zm_num_" .. digitID .. "2" )
			local f2_local4 = RegisterMaterial( "hud_zm_num_" .. digitID .. "3" )
			local f2_local5 = RegisterMaterial( "hud_zm_num_" .. digitID .. "4" )
			local f2_local6 = RegisterMaterial( "hud_zm_num_" .. digitID .. "5" )
			local f2_local7 = RegisterMaterial( "hud_zm_num_" .. digitID .. "6" )
			local f2_local8 = RegisterMaterial( "hud_zm_num_" .. digitID .. "7" )
			local f2_local9 = RegisterMaterial( "hud_zm_num_" .. digitID .. "8" )
			local f2_local10 = RegisterMaterial( "hud_zm_num_" .. digitID .. "9" )
			local f2_local11 = RegisterMaterial( "hud_zm_num_" .. digitID .. "slash" )
			local f2_local12 = RegisterMaterial( "hud_zm_num_" .. digitID .. "line" )
			DigitForegroundMaterials = f2_local1
		else
			local f2_local13 = {}
			local f2_local0 = RegisterMaterial( "hud_mp_num_big_0_white" )
			local f2_local1 = RegisterMaterial( "hud_mp_num_big_1_white" )
			local f2_local2 = RegisterMaterial( "hud_mp_num_big_2_white" )
			local f2_local3 = RegisterMaterial( "hud_mp_num_big_3_white" )
			local f2_local4 = RegisterMaterial( "hud_mp_num_big_4_white" )
			local f2_local5 = RegisterMaterial( "hud_mp_num_big_5_white" )
			local f2_local6 = RegisterMaterial( "hud_mp_num_big_6_white" )
			local f2_local7 = RegisterMaterial( "hud_mp_num_big_7_white" )
			local f2_local8 = RegisterMaterial( "hud_mp_num_big_8_white" )
			local f2_local9 = RegisterMaterial( "hud_mp_num_big_9_white" )
			local f2_local10 = RegisterMaterial( "hud_mp_num_big_slash_white" )
			local f2_local11 = RegisterMaterial( "hud_mp_num_big_line_white" )
			DigitBackgroundMaterials = f2_local0
			f2_local13 = {}
			f2_local0 = RegisterMaterial( "hud_mp_num_big_0" )
			f2_local1 = RegisterMaterial( "hud_mp_num_big_1" )
			f2_local2 = RegisterMaterial( "hud_mp_num_big_2" )
			f2_local3 = RegisterMaterial( "hud_mp_num_big_3" )
			f2_local4 = RegisterMaterial( "hud_mp_num_big_4" )
			f2_local5 = RegisterMaterial( "hud_mp_num_big_5" )
			f2_local6 = RegisterMaterial( "hud_mp_num_big_6" )
			f2_local7 = RegisterMaterial( "hud_mp_num_big_7" )
			f2_local8 = RegisterMaterial( "hud_mp_num_big_8" )
			f2_local9 = RegisterMaterial( "hud_mp_num_big_9" )
			f2_local10 = RegisterMaterial( "hud_mp_num_big_slash" )
			f2_local11 = RegisterMaterial( "hud_mp_num_big_line" )
			DigitForegroundMaterials = f2_local0
		end
	end
end

CoD.HUDDigit.setDigit = function ( self, number, pulseRed )
	if pulseRed then
		if not self.pulsing then
			self.pulsing = true
			if self.background then
				Digit_TransitionCompleteNormal( self.background )
			end
			Digit_TransitionCompleteNormal( self.foreground )
		end
	elseif self.pulsing then
		self.pulsing = nil
		if self.background then
			DigitBackground_TransitionCompletePulseRed( self.background )
		end
		DigitForeground_TransitionCompletePulseRed( self.foreground )
	end
	if self.background then
		self.background:setImage( DigitBackgroundMaterials[number + 1] )
	end
	self.foreground:setImage( DigitForegroundMaterials[number + 1] )
	self:setAlpha( 1 )
end

Digit_TransitionCompleteNormal = function ( image, event )
	if event and event.interrupted then
		return 
	else
		image:beginAnimation( "pulse_red", Digit_PulseRedDuration )
		image:setRGB( 1, 0, 0 )
	end
end

DigitBackground_TransitionCompletePulseRed = function ( image, event )
	if event and event.interrupted then
		return 
	elseif event then
		image:beginAnimation( "normal", Digit_PulseRedDuration )
	else
		image:completeAnimation()
	end
	image:setRGB( 1, 1, 1 )
end

DigitForeground_TransitionCompletePulseRed = function ( image, event )
	if event and event.interrupted then
		return 
	elseif event then
		image:beginAnimation( "normal", Digit_PulseRedDuration )
	else
		image:completeAnimation()
	end
	image:setRGB( 1, 1, 1 )
end

