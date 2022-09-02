-- f2a93bd31769d76df4a0841a75edc529
-- This hash is used for caching, delete to decompile the file again

CoD.cac_TrainingSimCompleted = InheritFrom( LUI.UIElement )
CoD.cac_TrainingSimCompleted.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.cac_TrainingSimCompleted )
	self.id = "cac_TrainingSimCompleted"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 20 )
	
	local completedString = LUI.UIText.new()
	completedString:setLeftRight( true, false, 0, 108 )
	completedString:setTopBottom( true, false, 0, 20 )
	completedString:setText( Engine.Localize( "MENU_COMPLETED_CAPS" ) )
	completedString:setTTF( "fonts/default.ttf" )
	completedString:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	completedString:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( completedString )
	self.completedString = completedString
	
	local rewardString = LUI.UIText.new()
	rewardString:setLeftRight( true, false, 0, 108 )
	rewardString:setTopBottom( true, false, 0, 20 )
	rewardString:setText( Engine.Localize( "MPUI_REWARD_CAPS" ) )
	rewardString:setTTF( "fonts/default.ttf" )
	rewardString:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rewardString:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rewardString )
	self.rewardString = rewardString
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				completedString:completeAnimation()
				self.completedString:setAlpha( 0 )
				self.clipFinished( completedString, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )

			end,
			Back = function ()
				self:setupElementClipCounter( 0 )

			end,
			Close = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				rewardString:completeAnimation()
				self.rewardString:setAlpha( 0 )
				self.clipFinished( rewardString, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

