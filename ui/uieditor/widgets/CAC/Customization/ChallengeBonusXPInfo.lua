-- 9434a67ad68d8b392fce20e4a2369c26
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ArabicAlignTextBox" )

CoD.ChallengeBonusXPInfo = InheritFrom( LUI.UIElement )
CoD.ChallengeBonusXPInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChallengeBonusXPInfo )
	self.id = "ChallengeBonusXPInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local xpIcon = LUI.UIImage.new()
	xpIcon:setLeftRight( true, false, 0, 21 )
	xpIcon:setTopBottom( false, true, -21, 0 )
	xpIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp_blue" ) )
	self:addElement( xpIcon )
	self.xpIcon = xpIcon
	
	local xpRewardText = CoD.ArabicAlignTextBox.new( menu, controller )
	xpRewardText:setLeftRight( true, false, 21.75, 89.75 )
	xpRewardText:setTopBottom( true, false, 0, 22 )
	xpRewardText.textBox:setTTF( "fonts/default.ttf" )
	xpRewardText.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	xpRewardText:linkToElementModel( self, "unlockReward", true, function ( model )
		local unlockReward = Engine.GetModelValue( model )
		if unlockReward then
			xpRewardText.textBox:setText( Engine.Localize( unlockReward ) )
		end
	end )
	self:addElement( xpRewardText )
	self.xpRewardText = xpRewardText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				xpIcon:completeAnimation()
				self.xpIcon:setAlpha( 1 )
				self.clipFinished( xpIcon, {} )

				xpRewardText:completeAnimation()
				self.xpRewardText:setAlpha( 1 )
				self.clipFinished( xpRewardText, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				xpIcon:completeAnimation()
				self.xpIcon:setAlpha( 0 )
				self.clipFinished( xpIcon, {} )

				xpRewardText:completeAnimation()
				self.xpRewardText:setAlpha( 0 )
				self.clipFinished( xpRewardText, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.xpRewardText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

