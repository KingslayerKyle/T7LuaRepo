CoD.PersonalizeCharacter_CPProgressionMessage = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacter_CPProgressionMessage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacter_CPProgressionMessage )
	self.id = "PersonalizeCharacter_CPProgressionMessage"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 372 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local campaignProgressionMessage = LUI.UIText.new()
	campaignProgressionMessage:setLeftRight( 0, 1, 0, 0 )
	campaignProgressionMessage:setTopBottom( 0, 0, 0, 38 )
	campaignProgressionMessage:setText( Engine.Localize( "HEROES_CAMPAIGN_PROGRESS_MESSAGE" ) )
	campaignProgressionMessage:setTTF( "fonts/default.ttf" )
	campaignProgressionMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	campaignProgressionMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( campaignProgressionMessage )
	self.campaignProgressionMessage = campaignProgressionMessage
	
	self.resetProperties = function ()
		campaignProgressionMessage:completeAnimation()
		campaignProgressionMessage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				campaignProgressionMessage:completeAnimation()
				self.campaignProgressionMessage:setAlpha( 0 )
				self.clipFinished( campaignProgressionMessage, {} )
			end
		},
		NeedMessage = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

