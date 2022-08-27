-- d99269d4377d38f8b170f706978b8bee
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.BM_DailyBundle_Countdown = InheritFrom( LUI.UIElement )
CoD.BM_DailyBundle_Countdown.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_DailyBundle_Countdown )
	self.id = "BM_DailyBundle_Countdown"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 469 )
	self:setTopBottom( true, false, 0, 22 )
	
	local countdownBacking = CoD.CAC_varientTitlePanel.new( menu, controller )
	countdownBacking:setLeftRight( true, true, 0, 0 )
	countdownBacking:setTopBottom( true, true, 0, 0 )
	countdownBacking:setAlpha( 0.35 )
	self:addElement( countdownBacking )
	self.countdownBacking = countdownBacking
	
	local countdown = LUI.UIText.new()
	countdown:setLeftRight( true, true, 0, 0 )
	countdown:setTopBottom( false, false, -9, 9 )
	countdown:setRGB( 0.74, 0.74, 0.74 )
	countdown:setText( Engine.Localize( "WEAPON_1234" ) )
	countdown:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	countdown:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	countdown:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( countdown )
	self.countdown = countdown
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				countdownBacking:completeAnimation()
				self.countdownBacking:setAlpha( 0 )
				self.clipFinished( countdownBacking, {} )
				countdown:completeAnimation()
				self.countdown:setAlpha( 0 )
				self.clipFinished( countdown, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				countdownBacking:completeAnimation()
				self.countdownBacking:setAlpha( 0.25 )
				self.clipFinished( countdownBacking, {} )
				countdown:completeAnimation()
				self.countdown:setAlpha( 1 )
				self.clipFinished( countdown, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.countdownBacking:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

