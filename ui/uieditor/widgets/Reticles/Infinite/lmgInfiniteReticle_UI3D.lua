-- b63e55b8fbf0bc919d94562c3ea94332
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.Infinite.lmgInfiniteReticle_UI3D_Internal" )

CoD.lmgInfiniteReticle_UI3D = InheritFrom( LUI.UIElement )
CoD.lmgInfiniteReticle_UI3D.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.lmgInfiniteReticle_UI3D )
	self.id = "lmgInfiniteReticle_UI3D"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 92 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.lmgInfiniteReticle_UI3D_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( controller, 3, 214, 92 )
	internal:setUI3DWindow( 3 )
	internal:linkToElementModel( self, nil, false, function ( model )
		internal:setModel( model, controller )
	end )
	self:addElement( internal )
	self.internal = internal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setAlpha( 1 )
				self.clipFinished( internal, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setAlpha( 0 )
				self.clipFinished( internal, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

