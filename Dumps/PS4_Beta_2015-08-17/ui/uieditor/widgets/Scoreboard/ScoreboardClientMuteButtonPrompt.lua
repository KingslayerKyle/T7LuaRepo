CoD.ScoreboardClientMuteButtonPrompt = InheritFrom( LUI.UIElement )
CoD.ScoreboardClientMuteButtonPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ScoreboardClientMuteButtonPrompt )
	self.id = "ScoreboardClientMuteButtonPrompt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 31 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( true, false, 0, 25.03 )
	buttonPromptImage:setTopBottom( true, false, 3.38, 27.63 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 29, 75 )
	label:setTopBottom( true, false, 7, 26 )
	label:setText( Engine.Localize( "Select" ) )
	label:setTTF( "fonts/default.ttf" )
	self:addElement( label )
	self.label = label
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 1 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return ScoreboardMuteButtonPromptHidden( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptVisible" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboardInfo.muteButtonPromptVisible"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

