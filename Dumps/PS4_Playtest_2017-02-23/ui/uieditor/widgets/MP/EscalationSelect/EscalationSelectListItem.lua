require( "ui.uieditor.widgets.onOffImage" )

CoD.EscalationSelectListItem = InheritFrom( LUI.UIElement )
CoD.EscalationSelectListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EscalationSelectListItem )
	self.id = "EscalationSelectListItem"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 178 )
	self:setTopBottom( 0, 0, 0, 84 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 0, 0, 0 )
	BlackBG:setTopBottom( 0, 0, 0, 0 )
	BlackBG:setRGB( 0, 0, 0 )
	BlackBG:setAlpha( 0.25 )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 2, -2 )
	background:setTopBottom( 0, 1, 2, -2 )
	background:setRGB( 0.22, 0.27, 0.27 )
	background:setAlpha( 0.85 )
	self:addElement( background )
	self.background = background
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0.25, 0.75, 2, -2 )
	image:setTopBottom( 0, 1, 2, -2 )
	image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local equippedIcon = CoD.onOffImage.new( menu, controller )
	equippedIcon:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsLoadoutEscalationItemEquipped( menu, self, controller )
			end
		}
	} )
	equippedIcon:setLeftRight( 1, 1, -20, -5 )
	equippedIcon:setTopBottom( 0, 0, 5, 20 )
	equippedIcon:setRGB( 0.56, 0.68, 0.27 )
	equippedIcon.image:setImage( RegisterImage( "t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	local count = LUI.UIText.new()
	count:setLeftRight( 1, 1, -22, -5 )
	count:setTopBottom( 0, 0, 57, 82 )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	count:linkToElementModel( self, "count", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			count:setText( PrependString( "x", modelValue ) )
		end
	end )
	self:addElement( count )
	self.count = count
	
	self.resetProperties = function ()
		background:completeAnimation()
		background:setAlpha( 0.85 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setAlpha( 0.5 )
				self.clipFinished( background, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.equippedIcon:close()
		self.image:close()
		self.count:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

