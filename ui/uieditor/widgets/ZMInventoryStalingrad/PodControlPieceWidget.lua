-- 83756366fdbd9f7d7f82722c1df9551a
-- This hash is used for caching, delete to decompile the file again

CoD.PodControlPieceWidget = InheritFrom( LUI.UIElement )
CoD.PodControlPieceWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PodControlPieceWidget )
	self.id = "PodControlPieceWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 89 )
	self:setTopBottom( true, false, 0, 89 )
	
	local PieceImageNewGreen = LUI.UIImage.new()
	PieceImageNewGreen:setLeftRight( true, false, 0, 88.52 )
	PieceImageNewGreen:setTopBottom( true, false, 0, 88.52 )
	self:addElement( PieceImageNewGreen )
	self.PieceImageNewGreen = PieceImageNewGreen
	
	local PieceImage = LUI.UIImage.new()
	PieceImage:setLeftRight( true, false, 0, 88.52 )
	PieceImage:setTopBottom( true, false, 0, 88.52 )
	self:addElement( PieceImage )
	self.PieceImage = PieceImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PieceImageNewGreen:completeAnimation()
				self.PieceImageNewGreen:setAlpha( 0 )
				self.clipFinished( PieceImageNewGreen, {} )
				PieceImage:completeAnimation()
				self.PieceImage:setAlpha( 0 )
				self.clipFinished( PieceImage, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PieceImageNewGreen:completeAnimation()
				self.PieceImageNewGreen:setAlpha( 1 )
				self.clipFinished( PieceImageNewGreen, {} )
				PieceImage:completeAnimation()
				self.PieceImage:setAlpha( 1 )
				self.clipFinished( PieceImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "zmInventory.piece_cylinder", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_cylinder" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_cylinder"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

