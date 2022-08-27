-- 69f94bb3e16ec01e5bb9de57dbc101f7
-- This hash is used for caching, delete to decompile the file again

CoD.AAR_Contracts_Pip = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_Pip.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AAR_Contracts_Pip )
	self.id = "AAR_Contracts_Pip"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local Pipempty = LUI.UIImage.new()
	Pipempty:setLeftRight( true, true, 0, 0 )
	Pipempty:setTopBottom( true, true, 0, 0 )
	Pipempty:setAlpha( 0 )
	Pipempty:setImage( RegisterImage( "uie_t7_bm_aar_contracts_pip_empty" ) )
	self:addElement( Pipempty )
	self.Pipempty = Pipempty
	
	local Pip = LUI.UIImage.new()
	Pip:setLeftRight( true, true, 0, 0 )
	Pip:setTopBottom( true, true, 0, 0 )
	Pip:setImage( RegisterImage( "uie_t7_bm_aar_contracts_pip_completed" ) )
	self:addElement( Pip )
	self.Pip = Pip
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Pipempty:completeAnimation()
				self.Pipempty:setAlpha( 1 )
				self.clipFinished( Pipempty, {} )
				Pip:completeAnimation()
				self.Pip:setRGB( 1, 1, 1 )
				self.Pip:setAlpha( 0 )
				self.clipFinished( Pip, {} )
			end
		},
		AllComplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Pipempty:completeAnimation()
				self.Pipempty:setLeftRight( true, true, 0, 0 )
				self.Pipempty:setTopBottom( true, true, 0, 0 )
				self.Pipempty:setAlpha( 0 )
				self.clipFinished( Pipempty, {} )
				Pip:completeAnimation()
				self.Pip:setRGB( 1, 1, 1 )
				self.clipFinished( Pip, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Pipempty:completeAnimation()
				self.Pipempty:setAlpha( 0 )
				self.clipFinished( Pipempty, {} )
				Pip:completeAnimation()
				self.Pip:setRGB( 1, 1, 1 )
				self.Pip:setAlpha( 1 )
				self.clipFinished( Pip, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

