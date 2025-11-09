CoD.LivesLeftContainer = InheritFrom( LUI.UIElement )
CoD.LivesLeftContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LivesLeftContainer )
	self.id = "LivesLeftContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 283 )
	self:setTopBottom( true, false, 0, 60 )
	
	local LivesLeft = LUI.UIText.new()
	LivesLeft:setLeftRight( true, false, 0, 283 )
	LivesLeft:setTopBottom( true, false, 0, 60 )
	LivesLeft:setText( Engine.Localize( "MPUI_LIVES_LEFT" ) )
	LivesLeft:setTTF( "fonts/default.ttf" )
	LivesLeft:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	LivesLeft:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LivesLeft )
	self.LivesLeft = LivesLeft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LivesLeft:completeAnimation()
				self.LivesLeft:setAlpha( 0 )
				self.clipFinished( LivesLeft, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return not IsGameTypeEqualToString( "oic" )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

