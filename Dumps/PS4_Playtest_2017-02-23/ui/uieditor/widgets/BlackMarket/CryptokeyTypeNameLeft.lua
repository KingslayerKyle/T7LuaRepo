require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeftInternal" )

CoD.CryptokeyTypeNameLeft = InheritFrom( LUI.UIElement )
CoD.CryptokeyTypeNameLeft.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CryptokeyTypeNameLeft )
	self.id = "CryptokeyTypeNameLeft"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 225 )
	self:setTopBottom( 0, 0, 0, 33 )
	self.anyChildUsesUpdateState = true
	
	local CryptokeyTypeNameLeftInternal = CoD.CryptokeyTypeNameLeftInternal.new( menu, controller )
	CryptokeyTypeNameLeftInternal:setLeftRight( 0, 0, -0.5, 224.5 )
	CryptokeyTypeNameLeftInternal:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	CryptokeyTypeNameLeftInternal:linkToElementModel( self, nil, false, function ( model )
		CryptokeyTypeNameLeftInternal:setModel( model, controller )
	end )
	CryptokeyTypeNameLeftInternal:linkToElementModel( self, "rarity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CryptokeyTypeNameLeftInternal.nameText:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( CryptokeyTypeNameLeftInternal )
	self.CryptokeyTypeNameLeftInternal = CryptokeyTypeNameLeftInternal
	
	self.resetProperties = function ()
		CryptokeyTypeNameLeftInternal:completeAnimation()
		CryptokeyTypeNameLeftInternal:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CryptokeyTypeNameLeftInternal:completeAnimation()
				self.CryptokeyTypeNameLeftInternal:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameLeftInternal, {} )
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
		self.CryptokeyTypeNameLeftInternal:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

