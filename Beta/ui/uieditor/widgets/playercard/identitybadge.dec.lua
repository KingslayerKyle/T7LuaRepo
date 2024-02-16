require( "ui.uieditor.widgets.Social.Social_background" )
require( "ui.uieditor.widgets.Social.Social_CallingCard" )

CoD.IdentityBadge = InheritFrom( LUI.UIElement )
CoD.IdentityBadge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IdentityBadge )
	self.id = "IdentityBadge"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 345 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardBG = CoD.Social_background.new( menu, controller )
	CallingCardBG:setLeftRight( false, false, -70, 172.25 )
	CallingCardBG:setTopBottom( false, false, -30, 30 )
	self:addElement( CallingCardBG )
	self.CallingCardBG = CallingCardBG
	
	local emblemBG = CoD.Social_background.new( menu, controller )
	emblemBG:setLeftRight( false, false, -172, -70 )
	emblemBG:setTopBottom( false, false, -30, 30 )
	self:addElement( emblemBG )
	self.emblemBG = emblemBG
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( false, false, -172, -70 )
	emblem:setTopBottom( false, false, -30, 30 )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local callingCard = CoD.Social_CallingCard.new( menu, controller )
	callingCard:setLeftRight( false, false, -70, 172.25 )
	callingCard:setTopBottom( false, false, -30, 30 )
	callingCard:linkToElementModel( self, nil, false, function ( model )
		callingCard:setModel( model, controller )
	end )
	self:addElement( callingCard )
	self.callingCard = callingCard
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardBG:close()
		self.emblemBG:close()
		self.callingCard:close()
		self.emblem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

