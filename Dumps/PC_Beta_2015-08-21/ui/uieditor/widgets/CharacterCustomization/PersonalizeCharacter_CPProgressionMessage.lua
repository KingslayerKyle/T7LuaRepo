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
	self:setLeftRight( true, false, 0, 248 )
	self:setTopBottom( true, false, 0, 25 )
	
	local campaignProgressionMessage = LUI.UIText.new()
	campaignProgressionMessage:setLeftRight( true, true, 0, 0 )
	campaignProgressionMessage:setTopBottom( true, false, 0, 25 )
	campaignProgressionMessage:setText( Engine.Localize( "HEROES_CAMPAIGN_PROGRESS_MESSAGE" ) )
	campaignProgressionMessage:setTTF( "fonts/default.ttf" )
	campaignProgressionMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	campaignProgressionMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( campaignProgressionMessage )
	self.campaignProgressionMessage = campaignProgressionMessage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				campaignProgressionMessage:completeAnimation()
				self.campaignProgressionMessage:setAlpha( 0 )
				self.clipFinished( campaignProgressionMessage, {} )
			end
		},
		NeedMessage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				campaignProgressionMessage:completeAnimation()
				self.campaignProgressionMessage:setAlpha( 1 )
				self.clipFinished( campaignProgressionMessage, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

