require( "ui.uieditor.widgets.CallingCards.CallingCards_BasicImage" )

local PostLoadFunc = function ( self, controller, menu )
	local potentialEmblemBGModelNames = {
		"iconId",
		"emblemBacking",
		"backgroundId",
		"selectedBg",
		"identityBadge.xuid"
	}
	self.CardIconFrame:linkToElementModel( self, nil, true, function ( model )
		if self.backingSubscription ~= nil then
			self:removeSubscription( self.backingSubscription )
		end
		for i = 1, #potentialEmblemBGModelNames, 1 do
			local modelPath = potentialEmblemBGModelNames[i]
			local idModel = Engine.GetModel( model, modelPath )
			if idModel then
				self.backingSubscription = self:subscribeToModel( idModel, function ( model )
					local backingId = Engine.GetModelValue( model )
					if modelPath == "identityBadge.xuid" then
						backingId = GetPlayerBackground( controller, backingId )
					end
					if backingId then
						CoD.ChallengesUtility.SetCallingCardForWidget( self.CardIconFrame, GetBackgroundByID( backingId ), menu.id )
					end
				end )
				break
			end
		end
	end )
end

CoD.CallingCards_FrameWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_FrameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_FrameWidget )
	self.id = "CallingCards_FrameWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local CardIconFrame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	CardIconFrame:setLeftRight( 0.5, 0.5, -360, 360 )
	CardIconFrame:setTopBottom( 0.5, 0.5, -90, 90 )
	CardIconFrame:changeFrameWidget( CoD.CallingCards_BasicImage )
	CardIconFrame:linkToElementModel( self, nil, false, function ( model )
		CardIconFrame:setModel( model, controller )
	end )
	self:addElement( CardIconFrame )
	self.CardIconFrame = CardIconFrame
	
	CardIconFrame.id = "CardIconFrame"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CardIconFrame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

