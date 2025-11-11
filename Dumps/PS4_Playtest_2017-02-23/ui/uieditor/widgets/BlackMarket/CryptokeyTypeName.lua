require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameInternal" )

CoD.CryptokeyTypeName = InheritFrom( LUI.UIElement )
CoD.CryptokeyTypeName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CryptokeyTypeName )
	self.id = "CryptokeyTypeName"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 126 )
	self:setTopBottom( 0, 0, 0, 33 )
	self.anyChildUsesUpdateState = true
	
	local CryptokeyTypeNameInternal = CoD.CryptokeyTypeNameInternal.new( menu, controller )
	CryptokeyTypeNameInternal:setLeftRight( 0, 0, -27, 153 )
	CryptokeyTypeNameInternal:setTopBottom( 0, 0, -0.5, 32.5 )
	CryptokeyTypeNameInternal:linkToElementModel( self, nil, false, function ( model )
		CryptokeyTypeNameInternal:setModel( model, controller )
	end )
	CryptokeyTypeNameInternal:linkToElementModel( self, "rarity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CryptokeyTypeNameInternal.nameText:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( CryptokeyTypeNameInternal )
	self.CryptokeyTypeNameInternal = CryptokeyTypeNameInternal
	
	self.resetProperties = function ()
		CryptokeyTypeNameInternal:completeAnimation()
		CryptokeyTypeNameInternal:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CryptokeyTypeNameInternal:completeAnimation()
				self.CryptokeyTypeNameInternal:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameInternal, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CryptokeyTypeNameInternal:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

