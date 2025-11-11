require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorButtonPromptArea" )
require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorCharacterCustomization" )
require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorDescriptionInfo" )
require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorHeaderInfo" )
require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorLoadout" )
require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorTraitSummary" )
require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorUnlockDescriptionInfo" )
require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorWeaponAttachments" )

CoD.freeCursorInfoPanel = InheritFrom( LUI.UIElement )
CoD.freeCursorInfoPanel.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorInfoPanel )
	self.id = "freeCursorInfoPanel"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local header = CoD.freeCursorHeaderInfo.new( menu, controller )
	header:setLeftRight( 0, 0, 0, 420 )
	header:setTopBottom( 0, 0, 0, 55 )
	header:linkToElementModel( self, nil, false, function ( model )
		header:setModel( model, controller )
	end )
	self:addElement( header )
	self.header = header
	
	local description = CoD.freeCursorDescriptionInfo.new( menu, controller )
	description:setLeftRight( 0, 0, 0, 420 )
	description:setTopBottom( 0, 0, 55, 155 )
	description:linkToElementModel( self, nil, false, function ( model )
		description:setModel( model, controller )
	end )
	self:addElement( description )
	self.description = description
	
	local weaponAttachments = CoD.freeCursorWeaponAttachments.new( menu, controller )
	weaponAttachments:setLeftRight( 0, 0, 0, 420 )
	weaponAttachments:setTopBottom( 0, 0, 155, 255 )
	weaponAttachments:linkToElementModel( self, nil, false, function ( model )
		weaponAttachments:setModel( model, controller )
	end )
	self:addElement( weaponAttachments )
	self.weaponAttachments = weaponAttachments
	
	local loadout = CoD.freeCursorLoadout.new( menu, controller )
	loadout:setLeftRight( 0, 0, 0, 420 )
	loadout:setTopBottom( 0, 0, 255, 464 )
	loadout:linkToElementModel( self, nil, false, function ( model )
		loadout:setModel( model, controller )
	end )
	self:addElement( loadout )
	self.loadout = loadout
	
	local freeCursorTraitSummary = CoD.freeCursorTraitSummary.new( menu, controller )
	freeCursorTraitSummary:setLeftRight( 0, 0, 0, 420 )
	freeCursorTraitSummary:setTopBottom( 0, 0, 464, 595 )
	freeCursorTraitSummary:linkToElementModel( self, nil, false, function ( model )
		freeCursorTraitSummary:setModel( model, controller )
	end )
	self:addElement( freeCursorTraitSummary )
	self.freeCursorTraitSummary = freeCursorTraitSummary
	
	local freeCursorCharacterCustomization = CoD.freeCursorCharacterCustomization.new( menu, controller )
	freeCursorCharacterCustomization:setLeftRight( 0, 0, 0, 420 )
	freeCursorCharacterCustomization:setTopBottom( 0, 0, 595, 669 )
	freeCursorCharacterCustomization:linkToElementModel( self, nil, false, function ( model )
		freeCursorCharacterCustomization:setModel( model, controller )
	end )
	self:addElement( freeCursorCharacterCustomization )
	self.freeCursorCharacterCustomization = freeCursorCharacterCustomization
	
	local unlockDescription = CoD.freeCursorUnlockDescriptionInfo.new( menu, controller )
	unlockDescription:setLeftRight( 0, 0, 0, 420 )
	unlockDescription:setTopBottom( 0, 0, 669, 769 )
	unlockDescription:linkToElementModel( self, nil, false, function ( model )
		unlockDescription:setModel( model, controller )
	end )
	self:addElement( unlockDescription )
	self.unlockDescription = unlockDescription
	
	local buttonPrompts = CoD.freeCursorButtonPromptArea.new( menu, controller )
	buttonPrompts:setLeftRight( 0, 0, 0, 420 )
	buttonPrompts:setTopBottom( 0, 0, 769, 817 )
	buttonPrompts:setAlpha( 0.7 )
	buttonPrompts:linkToElementModel( self, nil, false, function ( model )
		buttonPrompts:setModel( model, controller )
	end )
	self:addElement( buttonPrompts )
	self.buttonPrompts = buttonPrompts
	
	weaponAttachments.id = "weaponAttachments"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.header:close()
		self.description:close()
		self.weaponAttachments:close()
		self.loadout:close()
		self.freeCursorTraitSummary:close()
		self.freeCursorCharacterCustomization:close()
		self.unlockDescription:close()
		self.buttonPrompts:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

