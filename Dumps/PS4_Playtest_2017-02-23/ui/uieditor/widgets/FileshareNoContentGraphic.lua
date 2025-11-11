require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	Engine.CreateModel( rootModel, "itemsCount", false )
end

CoD.FileshareNoContentGraphic = InheritFrom( LUI.UIElement )
CoD.FileshareNoContentGraphic.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareNoContentGraphic )
	self.id = "FileshareNoContentGraphic"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1123 )
	self:setTopBottom( 0, 0, 0, 717 )
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, -4, -4 )
	StartMenuframenoBG0:setTopBottom( 0, 1, -4, -6 )
	StartMenuframenoBG0:setAlpha( 0.85 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local BoxButtonLrgInactiveDiag = LUI.UIImage.new()
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, -6, -4 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, -4, -6 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.45 )
	BoxButtonLrgInactiveDiag:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediagfull" ) )
	BoxButtonLrgInactiveDiag:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactiveDiag:setShaderVector( 0, 0, 0, 0, 0 )
	BoxButtonLrgInactiveDiag:setupNineSliceShader( 36, 36 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	self.resetProperties = function ()
		BoxButtonLrgInactiveDiag:completeAnimation()
		StartMenuframenoBG0:completeAnimation()
		BoxButtonLrgInactiveDiag:setAlpha( 0.45 )
		StartMenuframenoBG0:setAlpha( 0.85 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not FileshareHasContent( element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

